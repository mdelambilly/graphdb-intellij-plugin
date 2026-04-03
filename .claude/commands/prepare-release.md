# Prepare Release

Prépare une nouvelle version du plugin GraphDatabase pour publication.

## Étapes

1. **Demande le type de release** : patch (bug fix), minor (nouvelle feature), ou major (breaking change)
2. **Propose le numéro de version** basé sur la version actuelle dans `gradle.properties` et le type choisi. Demande confirmation.
3. **Demande les notes de release** : liste des changements principaux, ou propose de les générer à partir des commits depuis le dernier tag
4. **Met à jour les fichiers** :
   - `gradle.properties` : `pluginVersion = <version>`
   - `CHANGELOG.md` : ajoute une section `## [<version>] - YYYY-MM-DD` avec les notes
5. **Build et test** :
   - `.\gradlew.bat build test`
   - Si les tests échouent, arrête et signale le problème
6. **Vérifie le plugin** :
   - `.\gradlew.bat :graph-database-plugin:verifyPlugin`
   - Si des Internal API sont détectées, arrête et signale
7. **Build le plugin signé** :
   - `.\gradlew.bat :graph-database-plugin:buildPlugin`
   - Le signing est automatique si les variables d'environnement sont configurées
   - Le ZIP signé est dans `graph-database-plugin/build/distributions/`
8. **Git** :
   - `git add gradle.properties CHANGELOG.md`
   - `git commit -m "chore: release v<version>"`
   - `git tag v<version>`
   - `git push origin main --tags`
9. **Crée le draft GitHub** :
   - `gh release create v<version> --draft --title "v<version>" --notes-file -` avec les notes du changelog
   - Upload le ZIP signé : `gh release upload v<version> graph-database-plugin/build/distributions/GraphDatabase-<version>.zip`
10. **Affiche le résumé** :
    - Version : `<version>`
    - Tests : OK
    - Verifier : OK
    - Draft GitHub : lien
    - Rappel : "Va vérifier le draft sur GitHub, puis utilise la skill **Publish Release** pour finaliser."

## Règles

- Toujours builder et tester AVANT de committer
- Ne jamais publier la release GitHub (--draft uniquement)
- Si une étape échoue, arrêter et signaler sans continuer
- Le nom du ZIP peut varier — chercher dans `graph-database-plugin/build/distributions/` le fichier .zip le plus récent
