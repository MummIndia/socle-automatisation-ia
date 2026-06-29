# Objectif
Produire une note de veille périodique « logement & foncier » sur Lasalle (30140)
et Saint-Jean-du-Gard (30269), qui résume ce qui a changé depuis la veille précédente.

# Contexte & sources
- Annonces immobilières (vente / location) : SeLoger, Leboncoin, MeilleursAgents
  — nombre d'annonces et fourchettes de prix au m².
- Données publiques : nouvelles publications INSEE (recensement, parc de logements),
  DVF/DGFiP (nouvelles transactions enregistrées).
- Actualité locale logement : sites des mairies, de la CC Causses Aigoual Cévennes
  (Lasalle) et d'Alès Agglomération (Saint-Jean-du-Gard), presse locale (Midi Libre,
  Objectif Gard) — délibérations, PLU, logement social, meublés de tourisme.
- Le fichier `veille-history.md` (état des veilles précédentes), s'il existe.

# Étapes attendues
1. Lire `veille-history.md` s'il existe (état de la dernière veille).
2. Recueillir les infos à jour des sources ci-dessus (chiffre + date + URL).
3. Identifier ce qui est NOUVEAU ou a changé depuis la dernière veille.
4. Rédiger une note datée `veille-AAAA-MM.md` : faits marquants, chiffres, sources.
5. Mettre à jour `veille-history.md` (ajouter une entrée datée résumant la veille).

# Critères de réussite (VÉRIFIABLES)
- Un fichier `veille-AAAA-MM.md` daté est créé.
- Chaque information est sourcée (URL) et datée ; aucune donnée inventée.
- Une section « Ce qui a changé » distingue clairement les nouveautés.
- `veille-history.md` est mis à jour.

# Limites / à ne pas faire
- Ne pas inventer de chiffres ; si une source est inaccessible, l'écrire noir sur blanc.
- DVF et INSEE évoluent lentement : indiquer « pas de nouveauté » quand c'est le cas.
- Le décompte exact des meublés Airbnb n'est pas public : ne pas le fabriquer.

# Livrable
- `veille-AAAA-MM.md` (la note du mois) + `veille-history.md` (l'historique).
