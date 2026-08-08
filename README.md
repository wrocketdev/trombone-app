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

## Publication

`publication/` porte tout ce qui concerne la fiche Play :
[`FICHE-PLAY.md`](publication/FICHE-PLAY.md) est la source des textes,
[`play_api.py`](publication/play_api.py) les pose via l'API Android Publisher.

```bash
python publication/play_api.py etat     # lecture seule
python publication/play_api.py fiche    # écrit les textes depuis FICHE-PLAY.md
```

Reste à faire, dans l'ordre — le détail est en §7 de `FICHE-PLAY.md` :

- [ ] Créer l'application dans la Play Console — **manuel, aucune API ne le fait**
- [ ] Donner l'accès au compte de service sur cette application
- [ ] Remplacer l'App ID AdMob de test dans `android/app/src/main/AndroidManifest.xml`
- [ ] Publier une politique de confidentialité en HTTPS
- [ ] Icône 512 px, graphisme 1024 × 500, au moins deux captures
- [x] Clé de signature d'envoi (`android/key.properties`, hors dépôt)

## Signature

La clé d'envoi vit hors du dépôt ; `android/key.properties` la désigne et
`android/.gitignore` l'exclut. **Écrire son chemin avec des `/`** : dans un
fichier `.properties` l'antislash est un caractère d'échappement, et un chemin
mal lu produit un AAB signé avec la clé de debug — que Play refuse. Le build
échoue désormais franchement dans ce cas au lieu de retomber sur la clé de debug.

## Nommage

Trois champs différents, trois rôles à ne pas confondre :

| Champ | Valeur | Pourquoi |
| --- | --- | --- |
| `android:label` | `Trombone` | Le lanceur tronque vers 12 caractères |
| Titre Play (fr) | `Trombone : PDF, Scan & Word` | 30 caractères, indexé, localisable par langue |
| `applicationId` | `fr.trombone.pdf` | Définitif dès la première publication |
