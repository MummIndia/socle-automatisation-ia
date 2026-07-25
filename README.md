# Socle d'automatisation IA

> Mes outils d'automatisation, **portables et indépendants de l'outil**.
> Ma logique vit ici, dans des fichiers que je possède. L'IA qui exécute
> (Claude Code aujourd'hui, un autre modèle demain) n'est qu'un **moteur interchangeable**.

C'est ce qui fait la différence entre une *dépense* (collée à un outil, jetable)
et un *investissement* (réutilisable, transférable, reconstructible n'importe où).

## Contenu

| Élément | Rôle |
|---|---|
| `GOAL.template.md` | Gabarit d'objectif à copier pour chaque nouvelle automatisation. |
| `prompt-methode.template.md` | Gabarit pour figer ma méthode (style, règles permanentes). |
| `agent-loop.sh` | Boucle d'agents autonome, **pilotée par la variable `LLM_CMD`** (moteur interchangeable). |
| `playbooks/` | Mes automatisations réelles. 1 sous-dossier = 1 automatisation. |

## Lancer avec n'importe quel modèle

La boucle n'appelle jamais un outil en dur :

```bash
bash agent-loop.sh 5                          # défaut : Claude Code
LLM_CMD="un-autre-cli --print" bash agent-loop.sh 5   # un autre modèle
```

## Démarrer une nouvelle automatisation

```bash
cp -r playbooks/_exemple playbooks/ma-tache
# éditer playbooks/ma-tache/GOAL.md (objectif + critères de réussite vérifiables)
cd playbooks/ma-tache && bash ../../agent-loop.sh 5
```

## Playbooks disponibles

- `veille-logement/` — veille périodique logement & foncier (Lasalle, Saint-Jean-du-Gard).

## Garde-fous de la boucle

Plafond d'itérations · kill switch (fichier `STOP`) · 1 commit git par étape (tout est annulable) ·
arrêt automatique sur `OBJECTIF_ATTEINT`.

## Licence

Ce socle est fait pour être repris. Deux licences, selon la nature des fichiers :

- **Gabarits, playbooks et documentation** (`*.md`) —
  [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/deed.fr), texte
  intégral dans [`LICENSE`](LICENSE). Reprise, adaptation et usage commercial
  autorisés, à condition de créditer l'auteur et d'indiquer vos modifications.
- **Scripts** (`agent-loop.sh`) — [MIT](LICENSE-MIT).

Le nom et le logo de l'association Cévennes 2050 ne sont pas couverts : ils
appartiennent à l'association.

---
*Projet personnel — Matthieu (github.com/MummIndia).*
