# Méthode pour la veille logement (règles permanentes)

## Ton & format
- Factuel, concis, orienté décideur. Markdown, titres clairs.
- Toujours : un chiffre = une source (URL) + une date.

## Règles non négociables
- Aucune donnée inventée. « Donnée non disponible » est une réponse valable.
- Toujours comparer à la veille précédente (`veille-history.md`) et isoler les NOUVEAUTÉS.
- Distinguer fait vérifié / estimation / absence de donnée.

## Structure de la note mensuelle
1. Date de la veille + périmètre (Lasalle, Saint-Jean-du-Gard).
2. **Ce qui a changé** depuis la dernière fois (le plus important en haut).
3. Marché (annonces, prix) — chiffres + sources.
4. Données publiques (INSEE / DVF) — nouveautés éventuelles.
5. Actualité locale (mairies, EPCI, presse) — délibérations, PLU, meublés.
6. Sources (liste d'URLs).

## Outils
- Pour les pages qui **bloquent** (erreur 403) ou rendues en **JavaScript** (INSEE, MeilleursAgents,
  SeLoger...), utilise **Firecrawl** (outils `mcp__firecrawl__*`) plutôt que WebFetch.
