# Fiche Google Play — Trombone

Ce fichier **fait foi**. `play_api.py` lit les trois blocs de la section 1 et les
pose tels quels sur la fiche ; aucun texte n'est recopié dans le script.

Langue par défaut : **français (fr-FR)**, et elle seule pour l'instant.
L'interface est intégralement en français : publier une fiche `en-US` attirerait
des utilisateurs anglophones sur une application qu'ils ne peuvent pas lire, et
cela se paie en avis à une étoile. La fiche anglaise viendra avec la traduction
de l'interface, pas avant — chaque langue a sa propre fiche sur Play, elles sont
indépendantes.

---

## 1. Textes

### Titre

```
Trombone : PDF, Scan & Word
```

Le nom sous l'icône n'est **pas** ce titre : Android tronque le libellé du
lanceur vers douze caractères, donc `android:label` vaut `Trombone` tout court.
Le titre ci-dessus est le seul des deux champs à être indexé, et le seul à
disposer de trente caractères.

Le nom de marque ne rapporte rien en recherche au lancement — personne ne
cherche « trombone ». Ce sont `PDF`, `Scan` et `Word` qui travaillent, et la
marque qui se construit.

### Description courte

```
Fusionner, convertir, signer vos PDF. 24 outils, aucun envoi sur un serveur.
```

Champ indexé, pas un slogan. « Compresser » en a été retiré : la compression
existe bien, mais comme réglage d'export dans l'aperçu, pas comme outil du
catalogue — l'annoncer au même rang que les autres serait promettre une entrée
de menu qui n'existe pas.

### Description longue

```
Trombone réunit 24 outils PDF dans une seule application, en français, et les fait tourner sur votre téléphone.

VOS DOCUMENTS NE PARTENT NULLE PART

La plupart des applications PDF envoient vos fichiers sur leurs serveurs pour les traiter. Un bulletin de salaire, un contrat, un compte rendu médical : ce sont ces documents-là qu'on manipule en PDF. Trombone fait tout le travail sur l'appareil. Rien n'est téléversé, rien n'est conservé ailleurs, et il n'y a ni compte ni inscription.

Un seul outil a besoin du réseau : « Page web vers PDF », pour aller chercher l'adresse que vous lui donnez. Les vingt-trois autres fonctionnent sans connexion.

ASSEMBLER ET ORGANISER

• Fusionner plusieurs PDF en un seul, dans l'ordre que vous choisissez
• Diviser un PDF, extraire des pages, en supprimer, les réordonner
• Recto-verso : recoller deux scans, pages paires et impaires, dans le bon ordre
• Faire pivoter des pages, rogner les marges, ajouter des numéros de page

CONVERTIR VERS LE PDF

• Images vers PDF — JPG, PNG, photos de la galerie
• Excel vers PDF, PowerPoint vers PDF
• Page web vers PDF à partir d'une adresse
• Scanner un document papier avec l'appareil photo

CONVERTIR DEPUIS LE PDF

• PDF vers Word (DOCX), avec du texte modifiable
• PDF vers Excel (XLSX) : les tableaux repartent dans un classeur
• PDF vers PowerPoint (PPTX)
• PDF vers images (JPG, PNG)
• PDF/A, pour l'archivage à long terme

SÉCURITÉ

• Protéger un PDF par mot de passe
• Déverrouiller un PDF dont vous avez le mot de passe
• Caviarder une zone : le texte est réellement retiré du fichier, pas seulement recouvert d'un rectangle noir
• Réparer un PDF endommagé ou illisible

ÉDITER ET SIGNER

• Signer au doigt, et poser la signature où vous voulez sur la page
• Ajouter un filigrane
• Modifier et annoter du texte
• Comparer deux versions d'un même document
• Reconnaissance de texte (OCR) : rendre cherchable et copiable un PDF scanné

À L'EXPORT

Réglez la compression avant d'enregistrer, parcourez chaque page en aperçu, zoomez, puis enregistrez où vous voulez sur l'appareil ou partagez directement.

FORMATS PRIS EN CHARGE

PDF, DOCX (Word), XLSX (Excel), PPTX (PowerPoint), JPG, PNG, HTML.

QUELQUES USAGES

• Réunir plusieurs factures en un seul PDF avant de les envoyer au comptable
• Transformer un contrat scanné en document Word pour en corriger une clause
• Signer un bail reçu par e-mail, sans l'imprimer ni le rescanner
• Retirer le mot de passe d'un relevé bancaire pour pouvoir le classer
• Numériser une pile de papiers en un seul PDF, recto verso compris
• Masquer un numéro de sécurité sociale avant de transmettre une attestation
• Extraire les pages 3 à 7 d'un rapport qui en compte cinquante
• Réduire le poids d'un PDF trop lourd pour passer en pièce jointe
• Remettre dans le bon ordre les pages d'un document scanné à l'envers
• Récupérer les chiffres d'un tableau imprimé en PDF vers un tableur

CE QUE TROMBONE NE FAIT PAS

Autant le dire ici plutôt que de le laisser découvrir dans un avis.

La conversion vers PowerPoint produit des diapositives qui sont des images de page : la mise en page est fidèle, mais le texte n'y est pas modifiable. Un PDF scanné ne contient aucun texte tant que la reconnaissance de caractères n'est pas passée dessus. L'extraction de tableaux vers Excel reprend les valeurs, pas la mise en forme, et les tableaux sans colonnes régulières sont mal découpés.

L'application est gratuite et financée par la publicité. Une annonce peut apparaître après un export réussi — jamais pendant votre travail, jamais au lancement, et jamais la première fois.
```

---

## 2. Visuels

Attendus dans `publication/visuels/`, aux noms que `play_api.py` va chercher.
**Aucun n'existe encore.**

| Fichier | Format exigé par Play | État |
|---|---|---|
| `icone.png` | 512 × 512, PNG 32 bits | ❌ à dessiner — l'icône actuelle est celle du gabarit Flutter |
| `graphisme.png` | 1024 × 500 | ❌ à produire |
| `capture01.png` … `capture08.png` | ≥ 320 px de côté, ratio 16:9 ou 9:16, 2 minimum | ❌ à capturer |

L'ordre de la liste **est** l'ordre d'affichage, et seules les trois premières
sont visibles dans un résultat de recherche sans faire défiler. Elles doivent
donc porter les trois arguments dans l'ordre : ce que l'application fait, qu'elle
le fait sur l'appareil, et l'étendue du catalogue.

Les captures peuvent être prises sur l'appareil (`adb exec-out screencap -p`) :
l'écran d'accueil, la fusion avec ses vignettes, l'aperçu, et un écran de
sécurité sont les quatre qui montrent le plus.

---

## 3. Formulaire « Sécurité des données »

Réponses vérifiées ligne à ligne contre le code. Dépendances qui touchent à des
données : `google_mobile_ads`, `shared_preferences`, `permission_handler`,
`camera`, `google_mlkit_text_recognition`. Il n'y a **ni** Firebase, **ni** outil
de mesure d'audience, **ni** remontée de plantage. Aucun appel HTTP dans `lib/`.

| Question | Réponse |
|---|---|
| L'app collecte-t-elle ou partage-t-elle des données utilisateur ? | **Oui** — uniquement via le SDK publicitaire |
| Les données sont-elles chiffrées en transit ? | **Oui** |
| L'utilisateur peut-il demander la suppression de ses données ? | **Non** — rien n'est conservé hors de l'appareil |
| Politique Familles | Sans objet — pas destinée aux enfants |

**Types de données à déclarer :**

| Type | Collecté | Partagé | Finalité |
|---|---|---|---|
| Identifiants (identifiant publicitaire) | Oui | Oui | Publicité ou marketing |
| Position approximative (déduite de l'IP) | Oui | Oui | Publicité ou marketing |
| Historique d'application (interactions publicitaires) | Oui | Oui | Publicité ou marketing |

**Ne rien déclarer** pour les documents de l'utilisateur, les photos, la caméra
ni le texte reconnu par l'OCR : tout est traité sur l'appareil et Google demande
explicitement de ne pas déclarer le traitement local. C'est aussi l'argument de
vente — il faut que le formulaire le dise, pas seulement la description.

---

## 4. Classification du contenu (questionnaire IARC)

| Question | Réponse |
|---|---|
| Catégorie | Application → Outils / Productivité |
| Violence, sang, sexualité, langage grossier, drogue | Non à tout |
| Achats intégrés | **Non** |
| Publicité | **Oui** |
| Partage de position ou d'informations personnelles | Non |
| Interaction entre utilisateurs | **Non** |
| Contenu généré par les utilisateurs | **Non** |

Classement attendu : PEGI 3 / Tout public.

---

## 5. Déclarations diverses

| Déclaration | Valeur |
|---|---|
| Catégorie | Outils (secondaire : Productivité) |
| Public cible | 18 ans et plus |
| L'app contient-elle des publicités ? | **Oui** — badge « Contient des annonces » |
| Application d'actualités / COVID / gouvernement / finance | Non |
| Tags | pdf, fusionner pdf, pdf en word, scanner, signature, ocr, hors ligne |
| Pays de diffusion | France, Belgique, Suisse, Luxembourg, Canada — puis élargir |
| Politique de confidentialité | ⏳ à publier — voir §7 |
| Adresse e-mail de contact | ⏳ à décider — **publique sur la fiche**, donc une adresse dédiée |

> **Sur l'adresse e-mail.** Google l'affiche en clair sur la page publique de
> l'application, elle sera moissonnée. Utiliser une adresse dédiée, jamais
> l'adresse personnelle.

---

## 6. Permissions à justifier

| Permission | Déclarée pour | Justification à donner |
|---|---|---|
| `CAMERA` | L'outil « Scanner un document » | Demandée à l'exécution, juste avant l'ouverture de l'appareil photo, et par aucun autre outil |
| `INTERNET` | Publicité + outil « Page web vers PDF » | Aucun document de l'utilisateur ne transite |

`usesCleartextTraffic="true"` est présent pour que l'outil « page web vers PDF »
accepte une adresse en `http://` collée par l'utilisateur. C'est un vrai
assouplissement de la politique réseau : si le formulaire de sécurité pose la
question, c'est la réponse.

---

## 7. Ce qu'il reste avant de pouvoir soumettre

| # | Élément | État |
|---|---|---|
| 1 | Nom de paquet | ✅ `fr.trombone.pdf` |
| 2 | **Création de l'application dans la Play Console** | ❌ **manuel — aucune API ne le fait** |
| 3 | Accès du compte de service à la nouvelle app | ❌ Play Console > Utilisateurs et autorisations |
| 4 | Clé de signature d'envoi (`trombone-upload.jks`) | ❌ le build utilise encore la clé de debug — Play refusera l'AAB |
| 5 | Identifiants AdMob réels | ❌ l'App ID du manifeste est celui de test de Google |
| 6 | URL de politique de confidentialité en HTTPS | ❌ obligatoire, l'app affiche de la publicité |
| 7 | Adresse e-mail de contact publique | ❌ à décider |
| 8 | Icône 512, graphisme 1024×500, ≥ 2 captures | ❌ §2 |
| 9 | Fiche, sécurité des données, classification | ⏸ prêt ici — à poser **après** validation du binaire |
| 10 | Envoi de l'AAB | ⏸ bloqué par 2, 3 et 4 |

Les points **2 et 3 sont des clics dans la Play Console** : l'API Android
Publisher n'expose aucune méthode de création, toutes ses ressources commencent
par `applications/{packageName}/` et répondent 404 tant que le paquet n'existe
pas. Le nom de paquet lui-même n'est enregistré qu'au premier app bundle
téléversé.

Une fois ces deux points faits, la suite est entièrement scriptée :

```bash
python publication/play_api.py etat
python publication/play_api.py fiche
python publication/play_api.py contact
python publication/play_api.py visuels
python publication/play_api.py bundle build/app/outputs/bundle/release/app-release.aab
```
