# Publish Release

Finalise et publie une release préparée par la skill **Prepare Release**.

## Prérequis

- Un draft GitHub existe pour la version à publier
- Le ZIP signé est uploadé sur le draft
- Le développeur a vérifié le draft et donne son accord

## Étapes

1. **Vérifie le draft** :
   - `gh release list` pour trouver le draft le plus récent
   - Affiche le titre, le tag, et les notes du draft
   - Demande confirmation : "Publier la release v<version> ? (oui/non)"
2. **Publie la release GitHub** :
   - `gh release edit v<version> --draft=false`
   - Vérifie que la release est bien publique : `gh release view v<version>`
3. **Vérifie le déclenchement du job CI/CD** :
   - `gh run list --limit 5` pour voir si le workflow de publication JetBrains s'est déclenché
   - Affiche le statut du workflow
4. **Affiche le résumé** :
   - Release GitHub : lien
   - CI/CD JetBrains : statut du workflow (déclenché / en cours / terminé)
   - Rappel : "La publication sur JetBrains Marketplace est gérée par le job CI/CD. Vérifie sur https://plugins.jetbrains.com/plugin/31066-graphdatabase que la nouvelle version apparaît après quelques minutes."

## Règles

- Toujours demander confirmation avant de publier
- Ne jamais modifier le contenu de la release (notes, ZIP) — c'est le rôle de Prepare Release
- Si le workflow CI/CD échoue, signaler et proposer un upload manuel via `.\gradlew.bat :graph-database-plugin:publishPlugin`
