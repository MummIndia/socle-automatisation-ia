# Comment lancer cette veille

Cette tâche tourne dans ton bac à sable Docker (qui a Python + accès web).

1. Copie ce dossier dans l'espace de travail des agents (ou monte-le).
2. Dans le conteneur, place-toi dans ce dossier et lance :
   ```
   git init        # une seule fois, pour le filet de sécurité local
   bash ../../agent-loop.sh 3
   ```
   (Si le socle n'est pas dans le conteneur, copie `agent-loop.sh` à côté du GOAL.md
    et lance `bash agent-loop.sh 3`.)
3. Récupère la note `veille-AAAA-MM.md` produite.

## Pour en faire une vraie « veille » périodique
- À la main : relance la commande une fois par mois.
- Automatisé (plus tard) : Planificateur de tâches Windows, ou un service qui
  démarre le conteneur et lance la boucle chaque 1er du mois. On le mettra en place
  quand tu seras à l'aise.
