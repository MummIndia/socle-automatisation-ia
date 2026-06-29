# Socle d'automatisation IA — portable, à toi

Ce dossier contient **ta logique**, dans des fichiers que tu possèdes.
L'outil qui exécute (Claude Code aujourd'hui, un autre demain) n'est qu'un
**moteur interchangeable**. C'est ce qui transforme ton installation d'une
*dépense* (collée à un outil) en un *investissement* (réutilisable, transférable).

## Contenu
- `GOAL.template.md` — gabarit d'objectif à copier pour chaque nouvelle automatisation.
- `prompt-methode.template.md` — gabarit pour figer TA méthode (ton style, tes règles).
- `agent-loop.sh` — boucle autonome **indépendante de l'outil** (variable `LLM_CMD`).
- `playbooks/` — tes automatisations réelles (1 sous-dossier = 1 automatisation).

## Lancer avec N'IMPORTE QUEL modèle
La boucle n'appelle jamais un outil en dur : elle utilise la variable `LLM_CMD`.
Par défaut elle pointe sur Claude Code, mais tu peux la rediriger :

```bash
# Défaut (Claude Code)
bash agent-loop.sh 5

# Demain, avec un autre CLI/modèle (exemple)
LLM_CMD="mon-autre-cli --print" bash agent-loop.sh 5
```

## En faire un vrai actif : versionne-le
```bash
cd "ce-dossier"
git init
git add -A
git commit -m "socle initial"
```
À partir de là, tu peux le cloner, le partager, le reconstruire ailleurs.

## Pour démarrer une nouvelle automatisation
1. `cp -r playbooks/_exemple playbooks/ma-nouvelle-tache`
2. Édite son `GOAL.md` (objectif + critères de réussite vérifiables).
3. `cd playbooks/ma-nouvelle-tache && bash ../../agent-loop.sh 5`
