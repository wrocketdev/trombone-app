# Trombone

Vingt-quatre outils PDF pour Android, en français, qui travaillent **sur
l'appareil**. Fusionner, organiser, convertir, signer, protéger, reconnaître du
texte — aucun document n'est envoyé sur un serveur.

C'est la différence avec iLovePDF, Smallpdf ou PDF24 : leurs conversions
passent par leurs machines. Ici, `syncfusion_flutter_pdf`, `pdfx`,
`google_mlkit_text_recognition` et le moteur d'impression d'Android font tout
localement. La seule exception est l'outil « page web → PDF », qui va
évidemment chercher l'adresse qu'on lui donne.

## Construire

```bash
flutter pub get
flutter test          # 257 tests
flutter analyze
flutter build apk --release
```

## Ce que contient le dépôt

| Chemin | Contenu |
| --- | --- |
| `lib/core/` | Les moteurs : PDF, OCR, conversions Office, sécurité, export |
| `lib/screens/` | Un écran par outil, plus l'accueil et la recherche |
| `lib/theme/` | Le système de design — `AppColors`, `Space`, `Rule`, `Motion`, `ToolFamily` |
| `lib/widgets/ui/` | Le vocabulaire partagé : `PickedFileCard`, `ResultCard`, `PageTile`, `EmptyState` |
| `test/` | Contraste WCAG, débordements de mise en page, cibles tactiles, catalogue d'outils |
| `android/app/src/main/kotlin/` | Le canal « page web → PDF » (WebView + pipeline d'impression Android) |

## Avant publication

- [ ] Remplacer l'App ID AdMob de test dans `android/app/src/main/AndroidManifest.xml`
- [ ] Créer une configuration de signature release (le build utilise encore la clé de debug)
- [ ] Rédiger la fiche Play française — le titre visé est `Trombone : PDF, Scan & Word`

## Nommage

Trois champs différents, trois rôles à ne pas confondre :

| Champ | Valeur | Pourquoi |
| --- | --- | --- |
| `android:label` | `Trombone` | Le lanceur tronque vers 12 caractères |
| Titre Play (fr) | `Trombone : PDF, Scan & Word` | 30 caractères, indexé, localisable par langue |
| `applicationId` | `fr.trombone.pdf` | Définitif dès la première publication |
