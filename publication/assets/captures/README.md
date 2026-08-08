# Captures d'écran de la fiche Play

Captures **réelles**, prises sur le SM-S928B (Galaxy S24 Ultra, Android 16) sur
`fr.trombone.pdf`, en 1440 × 3120. Aucune maquette : une capture qui ne
correspond pas à l'application est un motif de rejet, et c'est aussi ce qui
produit les avis 1★ « ça ne ressemble pas à ça ».

**Sur le ratio.** 3120 / 1440 fait 2,167:1, au-dessus du 2:1 que plusieurs
guides annoncent comme plafond. Vérifié avant de retraiter quoi que ce soit :
les dix captures téléphone du compresseur vidéo sont exactement au même format
et sont en ligne sur Play. Le plafond n'est donc pas appliqué à ce format. Ne
pas recadrer, et surtout ne pas recadrer *dans* le vide vertical d'un écran —
ce serait montrer une interface qui n'existe pas.

## Ordre de dépôt

L'ordre de la liste dans `play_api.py` **est** l'ordre d'affichage, et seules les
trois premières sont visibles dans un résultat de recherche sans faire défiler.

| Rang | Fichier | Pourquoi cette place |
|---|---|---|
| 1 | `01-accueil.png` | Le catalogue. Une application PDF qui en fait vingt-quatre doit le montrer d'emblée — c'est l'argument que le titre à 30 caractères ne peut pas porter. |
| 2 | `02-fusion.png` | Le geste le plus cherché. **Une page y est volontairement écartée** : désaturée, « 2 pages sur 3 », et le bouton descendu à 4 pages. C'est ce qu'aucune capture de concurrent ne montre — qu'on choisit ce qu'on garde avant de fusionner. |
| 3 | `03-recherche.png` | La recherche par mots-clés. Répond à « je ne trouve jamais l'outil », le grief courant des applications à catalogue. La requête est `scan`, qui rend trois outils de trois familles ; `converti` n'en rendait que deux et laissait l'écran vide. |
| 4 | `04-apercu.png` | L'aperçu page à page avant export, avec Enregistrer, Partager et Compresser. |
| 5 | `05-proteger.png` | La sécurité : AES 256, les deux champs remplis pour que l'action primaire soit active, et l'avertissement d'irréversibilité. |
| 6 | `06-organiser.png` | Réordonner, extraire, diviser. |

## Conditions de prise de vue

Le téléphone doit être **déverrouillé** : `screencap` sur l'écran de
verrouillage rend l'écran de verrouillage, sans erreur — c'est ce qui est
arrivé au premier essai.

Activer le mode démo de SystemUI pendant la session pour retirer les icônes de
notification de la barre d'état, puis le **désactiver** :

```bash
adb shell settings put global sysui_demo_allowed 1
adb shell am broadcast -a com.android.systemui.demo -e command enter
adb shell am broadcast -a com.android.systemui.demo -e command clock -e hhmm 0900
adb shell am broadcast -a com.android.systemui.demo -e command battery -e level 100 -e plugged false
adb shell am broadcast -a com.android.systemui.demo -e command notifications -e visible false
# ... captures ...
adb shell am broadcast -a com.android.systemui.demo -e command exit
adb shell settings put global sysui_demo_allowed 0
```

One UI ignore la consigne d'heure et de batterie : l'heure réelle reste
affichée. Ce n'est pas bloquant, mais autant prendre les captures à une heure
présentable.

## Prendre une capture

```bash
adb shell screencap -p /sdcard/t.png
adb pull /sdcard/t.png publication/assets/captures/01-accueil.png
adb shell rm -f /sdcard/t.png
```

**Sans redirection.** `adb shell screencap -p > fichier.png` sous PowerShell
insère un BOM et convertit les fins de ligne : le PNG sort corrompu, et l'entête
commence par `ef bb bf` au lieu de `89 50 4e 47`.

## Documents de démonstration

Ne jamais capturer avec les vrais documents du téléphone : `/sdcard/Download/`
contient des bulletins de salaire et des attestations. Générer des PDF neutres
(`Contrat.pdf`, `Annexe.pdf`, `Facture.pdf`), prendre les captures, puis les
retirer de l'appareil.
