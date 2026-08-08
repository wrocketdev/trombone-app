# Projet — Fusion et manipulation de PDF

**Statut** : candidat retenu au terme du balayage du 2026-08-04/07. Point de départ de développement, pas engagement de production.
**Marché source** : `fusionner les documents` — 34 requêtes, cohérence 0,88, 42 apps collectées.
**Données** : `recherche/2026-08-07-fusionner-les-documents/market_data.json`

---

## 1. En une phrase

Un fusionneur de PDF **local, gratuit sans mur à l'export, financé par la publicité**, qui gagne ses places en nommant les besoins précis que les quatre acteurs du marché servent de façon générique — à commencer par le **recto-verso** et les **formats non-PDF**.

---

## 2. Ce que dit la mesure

### Ce qui est solide

| | |
|---|---|
| Requêtes réelles du marché | **34** (autocomplétion Google, storefront fr/fr) |
| Cohérence du cluster | **0,88** — la même app tient le top-3 sur 88 % des requêtes |
| Installs cumulés | 163 117 494 |
| Médiane du top-10 | 7 279 810 |
| **Porte de production** | **passée en entier** — `porte_viole: []` |
| B-fréquence (usage d'habitude) | **2,03 %** — seuil studio 1,5 % ✓ |
| B-pub (top-10 financé par la pub) | **90 %** ✓ |
| D-place (médiane top-10 ≤ 20 M) | 7,28 M ✓ |
| D-taille (cumul ≥ 5 M) | 163 M ✓ |
| Prénabilité (rho) | +0,349 — sous le seuil de 0,35, de justesse |
| Renouvellement du top-3 (< 24 mois) | 33 % (1 entrant / 2 titulaires) |

C'est le seul candidat du balayage à franchir les quatre critères de la porte.

### Ce qui ne l'est pas — à lire avant d'écrire une ligne de code

**Vitesse médiane des entrants récents : 813 installs/mois** (sur 16 entrants mesurés). Le seuil interne est de 5 000. Le meilleur entrant du marché — *Fusionner PDF - Combiner PDF*, 6 mois d'existence — est à environ **4 900 installs/mois**.

**Vacance du marché : 0 %.** Les 34 requêtes ont toutes un occupant crédible dans leur top-3. Ce n'est pas un trou, c'est un marché servi que l'on attaque par la qualité et la couverture.

Traduction honnête : le pari n'est pas « marché vide à conquérir », c'est « marché correct où une petite app bien ciblée peut prendre des places ». À la trajectoire du meilleur entrant, on parle de l'ordre de **50 000 à 60 000 installs la première année**, pas de millions. Aucune donnée de revenu n'existe dans ce balayage — quiconque avance un chiffre d'affaires l'invente.

---

## 3. D'où vient ce candidat

Chaîne de traitement, du plus large au plus fin :

1. **Moisson** (`moisson/moissonne.py`) — 1 917 préfixes d'autocomplétion Google → **15 479 requêtes** réelles françaises.
2. **SERP** (`moisson/serp.py`) — une recherche Play par requête → **15 474 classements**, 30,6 h, 30 requêtes sans résultat (0,2 %).
3. **Marchés** (`moisson/marches.py`) — regroupement en étoile sur les têtes de classement → **1 064 marchés**, le plus gros à 2 % du corpus.
4. **Criblage** (`moisson/crible.py`) — **20 106 fiches** téléchargées en 14,3 h, cache total 27 234.
5. **Wedge d'absence** (`moisson/wedge.py`) — part des requêtes sans occupant crédible.
6. **Percée** (`moisson/percee.py`) — **59 % des marchés sérieux ont une app de moins de 24 mois en top-3.** C'est la mesure qui a fait retenir ce candidat : occupé ≠ fermé.
7. **Publicité** (`moisson/pub.py`) — filtre sur la contrainte du studio : vivre de la pub seule, donc fréquence ≥ 1,5 % **ou** flux d'arrivées élevé, et top-10 financé par la pub.
8. **ASO** (`moisson/aso.py`) — difficulté requête par requête.

Candidats écartés en cours de route, pour mémoire : bloqueur d'appels (B-fréquence 0,39 %, vit d'abonnements), détecteur de contenu IA (le marché vend la détection **et** son contournement au même utilisateur), retouche des yeux (trop niche), génération vidéo IA (coût d'inférence variable, autre métier).

---

## 4. Les concurrents

Quatre apps tiennent le marché entier. Tout le reste ne tient qu'une requête chacun.

| App | Installs | Note | Requêtes en top-3 | Dernière MàJ |
|---|---|---|---|---|
| PDF : Fusion, Scan, Signature | 5 124 899 | 4,64 | **30 / 34** | il y a 185 j |
| Fusionner PDF : PDF Merger | 586 718 | 4,42 | 26 / 34 | il y a 7 j |
| **Fusionner PDF - Combiner PDF** | **29 455** | **4,44** | **23 / 34** | il y a 57 j |
| iLovePDF Éditeur PDF & Scanner | 21 088 939 | 4,68 | 15 / 34 | il y a 4 j |

**La cible est la troisième ligne.** Une app de six mois et 29 455 installs occupe 23 places en top-3 face à des apps de 5 et 21 millions. Le classement récompense la pertinence, pas la taille — c'est le fondement stratégique de ce projet.

**Le leader est figé** : 185 jours sans livraison, tout en tenant 30 requêtes sur 34.

**iLovePDF est un cas à part** : c'est une marque venue du web, citée nommément dans 3 des 34 requêtes (*fusionner i love pdf*, *organiser i love pdf*, *fusionner pdf i love pdf*). Elle ne porte pas de publicité — elle vit d'abonnements. On ne l'attaque pas de front ; on prend les requêtes qu'elle ne couvre pas.

---

## 5. Ce que les utilisateurs reprochent

Analyse de 2 724 avis collectés sur les 8 spécialistes, 164 avis négatifs (1 et 2 étoiles).

| Motif | Part des négatifs |
|---|---|
| **Paywall / abonnement** | **15 %** |
| Plantage / lenteur | 8 % |
| Publicité envahissante | 7 % |
| Qualité dégradée | 2 % |
| Taille de fichier | 1 % |
| Perte de données | 1 % |

Verbatims :

> « payant en fait dès qu'on veut enregistrer » — *iLovePDF*
> « je pensais que c'était une application gratuite mais malheureusement non » — *iLovePDF*
> « impossible de sauvegarder sans s'abonner. grosse perte de temps » — *iLovePDF*

Le taux de plaintes est faible (2 à 10 % selon l'app) : **on n'affronte pas de l'incompétence**, on affronte des produits corrects, génériques et figés, dont le seul point de rupture net est le mur à l'export.

---

## 6. Positionnement

> **Fusionner ses PDF sans jamais tomber sur un mur.**
> Tout se passe sur le téléphone, rien n'est envoyé nulle part, l'export est gratuit et illimité.

Trois promesses, dans cet ordre :

1. **Pas de mur à l'export.** Jamais d'abonnement, jamais de filigrane, jamais de limite de pages ou de fichiers. C'est la douleur n°1 mesurée et la seule promesse que les concurrents financés par abonnement ne peuvent pas écrire.
2. **Tout en local.** Les documents fusionnés sont des papiers administratifs, factures, dossiers médicaux. Rien ne quitte l'appareil : pas de limite de taille, pas de compte, fonctionne hors réseau.
3. **Les cas que les autres ne nomment pas.** Recto-verso, Word + PDF, images et BMP, fusionner + compresser.

---

## 7. Périmètre v1

### 7.1 Fusion

- Sélection multiple de fichiers depuis le stockage, Drive, pièces jointes
- **Réordonnancement par glisser-déposer**, avec vignette de première page
- Rotation par document et par page
- Suppression de pages avant fusion
- Aperçu du résultat avant export

### 7.2 Mode recto-verso — la fonctionnalité signature

Le cas réel : on scanne un document recto-verso avec un chargeur simple face. On obtient deux fichiers — les pages impaires dans l'ordre, les pages paires **dans l'ordre inverse**. Il faut les entrelacer.

- Entrée : deux fichiers (impaires, paires)
- Option « le second fichier est en ordre inverse » (cochée par défaut, c'est le cas courant)
- Gestion du nombre impair de pages (dernière page verso vide)
- Aperçu de l'entrelacement avant export

Techniquement trivial. **Aucun des trois occupants de la requête `fusionner recto verso pdf` ne le fait** — ce sont des fusionneurs génériques que Play y place faute de mieux.

### 7.3 Formats acceptés dans la pile

PDF, **Word (.doc/.docx)**, images (JPG, PNG, **BMP**, WebP, HEIC), texte. Tous convertis puis fusionnés dans un seul PDF de sortie.

Justifie les requêtes 20 (`fusionner bmp en pdf`) et 26 (`fusionner un word et un pdf`), dont les occupants actuels sont des convertisseurs sans un seul avis.

### 7.4 Compression optionnelle après fusion

Trois niveaux, avec **taille estimée affichée avant application** — la plainte « qualité dégradée » vient de compressions subies, pas choisies. Couvre les requêtes 6 et 34.

### 7.5 Organisation

Diviser un PDF, extraire une plage de pages, réordonner un PDF existant. Couvre la requête 30 (`fusionner et organiser pdf`).

### 7.6 Gros fichiers

Traitement en flux, sans charger le document entier en mémoire. Barre de progression, annulation possible. Couvre la requête 19 (`fusionner gros pdf`).

---

## 8. Hors périmètre v1

Édition de texte dans le PDF, OCR, signature électronique, scanner, synchronisation cloud, compte utilisateur, collaboration. Chacun de ces éléments ouvre un autre marché et alourdit une app dont l'argument est d'être directe.

---

## 9. Modèle économique — publicité seule

Contrainte posée : pas d'achats intégrés. Le marché le permet, **90 % du top-10 porte déjà de la publicité**.

**Règles de placement, non négociables :**

- Interstitiel **après** un export réussi, jamais avant, jamais pendant
- Aucune publicité récompensée en échange d'une fonctionnalité — c'est le mur déguisé que les utilisateurs sanctionnent
- Aucune bannière dans l'écran de manipulation des pages
- Fréquence plafonnée : un interstitiel maximum toutes les N minutes

7 % des avis négatifs du marché portent sur la publicité envahissante. L'argument « gratuit sans mur » ne survit pas à une app qui harcèle.

---

## 10. Fiche Play et plan ASO

### Titre (30 caractères max)

```
Fusionner PDF, Word & Images
```

### Description courte (80 caractères max)

```
Fusionnez PDF, Word et images. Recto verso. Gratuit, hors ligne, sans limite.
```

### Angles de la description longue

Ouvrir sur la promesse d'export libre. Puis une section par besoin nommé, en reprenant les formulations exactes des requêtes : fusionner plusieurs PDF en un seul, fusionner recto verso, fusionner un Word et un PDF, fusionner et compresser, fusionner de gros fichiers, fusionner des images en PDF. Fermer sur le local et l'absence de compte.

### Ordre d'attaque des 34 requêtes

Difficulté mesurée par la force du plus faible occupant du top-3 : 2 prenables, 22 contestables, 10 difficiles.

**Vague 1 — prenable à la sortie** (occupants sans aucun avis)
- `fusionner bmp en pdf` — occupants : Bmp File Converter (11 279, note 0,00), Bmp Converter (54 417, note 0,00)
- `fusionner fichier` — occupant faible : Files Merger (20 524, note 0,00, 205 j sans MàJ)

**Vague 2 — la fonctionnalité signature**
- `fusionner recto verso pdf` — classée difficile en force, **vide en réponse**

**Vague 3 — les 7 requêtes « gratuit »**, toutes contestables, toutes avec le maillon faible à 29 k en top-3
- `fusionner gratuitement`, `fusionner gratuitement 2 pdf`, `fusionner gratuitement des pdf`, `fusionner des pdf gratuitement`, `fusionner fichier pdf gratuit`, `fusionner les pdf gratuitement`, `fusionner pdf gratuitement`, `fusionner pdf gratuit en ligne`

**Vague 4 — les combinés**
- `fusionner et compresser pdf`, `compresser et fusionner pdf`, `fusionner et organiser pdf`

**Vague 5 — les génériques** (à prendre avec le volume, pas au lancement)
- `fusionner pdf`, `fusionner en un seul pdf`, `fusionner plusieurs pdf en un seul`, `fusionner des pdf`, `fusionner les pdf`, `fusionner document`, `fusionner un document`, `fusionner documents pdf`, `fusionner les documents`, `fusionner en pdf`, `fusionner un pdf`, `fusionner plusieurs pdf`, `fusionner un fichier`, `fusionner 2 pdf`, `fusionner trois pdf`, `fusionner gros pdf`, `fusionner un word et un pdf`

**Non ciblées** : `fusionner i love pdf`, `organiser i love pdf`, `fusionner pdf i love pdf` — requêtes de marque, on ne prend pas iLovePDF de front.

`python moisson/aso.py --slug=2026-08-07-fusionner-les-documents` régénère ce tableau avec les occupants à jour.

---

## 11. Contraintes techniques

- **Android**, tout en local, aucun serveur, aucun coût variable
- Traitement en flux pour les gros fichiers, annulation possible
- Aucune permission au-delà de l'accès aux fichiers sélectionnés (Storage Access Framework, pas d'accès global au stockage)
- Fonctionnement complet hors réseau — la publicité est le seul appel sortant
- Cible de taille d'APK modeste : l'app doit s'installer vite depuis une recherche

---

## 12. Critères de succès et signaux d'invalidation

**À 3 mois**
- Présence en top-3 sur les 2 requêtes de la vague 1 et sur `fusionner recto verso pdf`
- Note ≥ 4,3
- Aucun avis négatif mentionnant un mur à l'export

**À 6 mois**
- Top-3 sur 10 requêtes minimum (le meilleur entrant du marché en tient 23 à 6 mois — c'est la référence)
- Trajectoire d'installs comparable ou supérieure à 4 900/mois

**Ce qui invalide le pari**
- Moins de 800 installs/mois à 6 mois : on est sur la médiane des entrants, le marché ne rend pas ce qu'on espère
- Impossibilité de tenir un top-3 malgré une couverture de requêtes correcte : le classement ne récompenserait pas la pertinence comme observé, et toute la thèse tombe
- Le leader figé (185 j) qui se réveille avec une refonte

---

## 13. Risques

| Risque | Portée |
|---|---|
| **Vitesse médiane à 813 installs/mois** | Le plus sérieux. Le marché est réel mais rend peu à l'entrant moyen. |
| Concurrents bien notés (4,42 à 4,68) | On n'attaque pas de l'incompétence. La qualité d'exécution est la condition d'entrée, pas l'avantage. |
| Une partie de la demande part sur le web | 3 requêtes citent iLovePDF, `fusionner pdf gratuit en ligne` dit « en ligne ». |
| Marché à faible fréquence intrinsèque | On fusionne un PDF quand on en a besoin, pas tous les jours. B-fréquence à 2,03 % est correct mais pas confortable. |
| Publicité mal dosée | Détruit la seule promesse différenciante. Le placement est un choix produit, pas un réglage. |

---

## 14. Où sont les données

| Fichier | Contenu |
|---|---|
| `recherche/2026-08-07-fusionner-les-documents/market_data.json` | 34 requêtes avec leur top-12, 42 fiches d'apps |
| `moisson/donnees/marches.json` | 1 064 marchés du balayage |
| `moisson/donnees/classement.json` | notation complète, `tous` et `retenus` |
| `moisson/donnees/wedge.json` | vacance requête par requête, 634 marchés |
| `moisson/donnees/percee.json` | renouvellement du top-3, 158 marchés sérieux |
| `moisson/donnees/apps.jsonl` | 21 393 fiches du balayage (le cache atteint 27 234 une fois amorcé depuis les cartographies de `recherche/`) |
| `moisson/donnees/avis_pdf.jsonl` | 2 724 avis des 8 concurrents |

Commandes de régénération, toutes sans réseau sauf mention :

```bash
python moisson/marches.py                 # regroupement en marches
python moisson/crible.py --note-seulement # notation sur le cache
python moisson/wedge.py                   # vacance
python moisson/percee.py                  # penetrabilite
python moisson/pub.py                     # marches viables en pub seule
python moisson/aso.py --slug=2026-08-07-fusionner-les-documents
python recherche/pertinence.py            # verdict definitif apres tri
```
