#!/usr/bin/env bash
# Boucle autonome ENCADREE et INDEPENDANTE DE L'OUTIL.
# Le moteur d'execution est dans la variable LLM_CMD -> remplacable a tout moment.
#
#   bash agent-loop.sh 5
#   LLM_CMD="autre-cli --print" bash agent-loop.sh 5
#
# Garde-fous : plafond d'iterations, kill switch (fichier STOP), 1 commit git/iteration,
# arret automatique sur OBJECTIF_ATTEINT.
set -euo pipefail

MAX_RUNS="${1:-5}"
GOAL="${GOAL:-GOAL.md}"
BRANCH="${BRANCH:-agent/auto}"
NOTES="SHARED_TASK_NOTES.md"
# >>> Le seul endroit couple a un outil : change cette ligne pour changer de modele <<<
LLM_CMD="${LLM_CMD:-claude -p --dangerously-skip-permissions}"

git config --global --add safe.directory '*' >/dev/null 2>&1 || true
[ -d .git ] || git init -q
[ -f "$GOAL" ] || { echo "ERREUR: objectif $GOAL introuvable."; exit 1; }
git config user.email >/dev/null 2>&1 || git config user.email "agent@local"
git config user.name  >/dev/null 2>&1 || git config user.name  "agent-local"

echo "Moteur : $LLM_CMD"
echo "Bascule sur la branche $BRANCH..."
git checkout -B "$BRANCH" >/dev/null 2>&1
[ -f "$NOTES" ] || printf '# Notes partagees entre iterations\n' > "$NOTES"

for i in $(seq 1 "$MAX_RUNS"); do
  if [ -f STOP ]; then echo "STOP detecte -> arret."; rm -f STOP; break; fi
  echo ""; echo "=== Iteration $i / $MAX_RUNS ==="
  PROMPT="Objectif global : lis le fichier $GOAL.
Contexte des iterations precedentes : lis le fichier $NOTES.
Si un fichier prompt-methode.md existe, respecte les regles qu'il contient.
Travaille UNE etape concrete vers l'objectif. Mets a jour $NOTES (fait / reste a faire).
Si l'objectif est ENTIEREMENT atteint et verifie, ecris sur une ligne seule: OBJECTIF_ATTEINT
Ne fais AUCUNE operation git. Reste dans ce dossier."
  set +e
  OUT="$(printf '%s' "$PROMPT" | $LLM_CMD 2>&1)"
  set -e
  echo "$OUT" | tee "loop-iteration-$i.log"
  if echo "$OUT" | grep -q "OBJECTIF_ATTEINT"; then
    git add -A; git commit -m "agent: iteration $i (objectif atteint)" --allow-empty >/dev/null
    echo "Objectif atteint a l'iteration $i."; break
  fi
  git add -A; git commit -m "agent: iteration $i" --allow-empty >/dev/null
  echo "Iteration $i sauvegardee."
done
echo ""; echo "Inspecter : git log --oneline ; git diff main..$BRANCH"
