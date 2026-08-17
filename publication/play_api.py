"""Pilotage de la fiche Google Play de Trombone par l'API Android Publisher.

Repris du script ecrit pour Kwizu (belote), reduit a ce dont Trombone a
besoin : pas de produit integre ici, l'application n'embarque pas
`in_app_purchase`.

Pourquoi ce script plutot qu'une serie de clics : la Play Console ne prend
les visuels et le binaire que par une boite de dialogue de fichiers,
qu'aucun outil d'automatisation ne pilote. L'API accepte tout — fiche,
images, app bundle — et rend chaque publication reproductible.

CE QUE L'API NE SAIT PAS FAIRE
------------------------------
**Creer l'application.** `androidpublisher` v3 n'expose aucune methode de
creation : ses ressources commencent toutes par
`applications/{packageName}/...` et repondent 404 tant que le paquet
n'existe pas. La creation se fait a la main dans la Play Console
(« Creer une application »), et le nom de paquet ne se fixe qu'au premier
app bundle televerse. Tout le reste — textes, visuels, pistes, binaire —
passe par ici.

Ne savent pas non plus se faire par cette API : le questionnaire de
classification IARC, le formulaire « Public cible », et l'acces du compte
de service a la nouvelle application (a accorder dans
Play Console > Utilisateurs et autorisations).

Usage :
    python play_api.py etat        (lecture seule)
    python play_api.py prochain-code  (lecture seule : versionCode suivant)
    python play_api.py fiche       (ECRIT les textes depuis FICHE-PLAY.md)
    python play_api.py contact     (ECRIT le site et l'e-mail de contact)
    python play_api.py visuels     (ECRIT ce qui manque, n'ecrase rien)
    python play_api.py bundle <chemin.aab>   (ECRIT : brouillon sur alpha)
    python play_api.py publier               (ECRIT : alpha -> completed)
    python play_api.py deployer <piste> <versionCode>
                                   (ECRIT : rattache un binaire DEJA depose)

Chaque commande ouvre un « edit », applique ses changements et le valide.
Un edit non valide expire tout seul : en cas d'erreur en cours de route,
rien n'est ecrit.
"""

from __future__ import annotations

import os
import sys
from pathlib import Path

import requests
from google.auth.transport.requests import Request
from google.oauth2 import service_account

# La cle du compte de service. En local elle vit dans `~/cles-android/`;
# l'integration continue n'a pas ce dossier et passe le chemin par la
# variable `PLAY_SERVICE_ACCOUNT` (un fichier JSON ecrit par le workflow).
CLE = Path(
    os.environ.get(
        "PLAY_SERVICE_ACCOUNT",
        str(Path.home() / "cles-android" / "play-publisher.json"),
    )
)

# Definitif. Il a ete choisi pour ne nommer aucun outil en particulier :
# l'identifiant precedent, `com.fusionpdf.fusion_pdf`, aurait fige « fusion »
# dans une application qui propose vingt-quatre outils.
PAQUET = "com.kwizu.trombone"

LANGUE = "fr-FR"
RACINE = Path(__file__).resolve().parent
PROJET = RACINE.parent

API = "https://androidpublisher.googleapis.com/androidpublisher/v3"
TELEVERSEMENT = "https://androidpublisher.googleapis.com/upload/androidpublisher/v3"
PORTEE = ["https://www.googleapis.com/auth/androidpublisher"]


def session() -> requests.Session:
    creds = service_account.Credentials.from_service_account_file(
        str(CLE), scopes=PORTEE
    )
    creds.refresh(Request())
    s = requests.Session()
    s.headers["Authorization"] = f"Bearer {creds.token}"
    return s


def verifier(r: requests.Response) -> dict:
    if not r.ok:
        # Le 404 sur un paquet inexistant est le cas le plus frequent au
        # demarrage, et son message brut n'explique rien.
        if r.status_code == 404 and PAQUET in r.url:
            raise SystemExit(
                f"404 sur {PAQUET}.\n\n"
                "Deux causes possibles, dans cet ordre :\n"
                "  1. L'application n'existe pas encore dans la Play Console.\n"
                "     L'API ne sait pas la creer : il faut passer par\n"
                "     « Creer une application », puis televerser un premier\n"
                "     app bundle pour que le nom de paquet soit enregistre.\n"
                "  2. Elle existe, mais le compte de service n'y a pas acces.\n"
                "     Play Console > Utilisateurs et autorisations > le compte\n"
                "     de service > ajouter l'application.\n"
            )
        raise SystemExit(f"HTTP {r.status_code} sur {r.url}\n{r.text}")
    return r.json() if r.content else {}


class Edit:
    """Un edit Play, ferme proprement quoi qu'il arrive.

    Sortir sans valider **ni** abandonner laisse un edit ouvert qui bloque
    les suivants avec une erreur peu parlante ; d'ou le gestionnaire de
    contexte.
    """

    def __init__(self, s: requests.Session):
        self.s = s
        self.id: str | None = None

    def __enter__(self) -> "Edit":
        self.id = verifier(self.s.post(f"{API}/applications/{PAQUET}/edits"))["id"]
        return self

    def __exit__(self, exc_type, exc, tb) -> bool:
        if exc_type is not None:
            self.s.delete(f"{API}/applications/{PAQUET}/edits/{self.id}")
            return False
        verifier(self.s.post(f"{API}/applications/{PAQUET}/edits/{self.id}:commit"))
        return False

    def url(self, chemin: str) -> str:
        return f"{API}/applications/{PAQUET}/edits/{self.id}/{chemin}"

    def url_televersement(self, chemin: str) -> str:
        return f"{TELEVERSEMENT}/applications/{PAQUET}/edits/{self.id}/{chemin}"


# --- Contenu de la fiche ----------------------------------------------------
# Les textes ne sont **pas** recopies ici : ils sont lus dans
# publication/FICHE-PLAY.md, qui fait foi. Une copie dans ce fichier finit
# toujours par diverger sans que rien ne le signale.

FICHE = RACINE / "FICHE-PLAY.md"


def _bloc(titre: str) -> str:
    """Le premier bloc ``` sous le titre de section demande."""
    texte = FICHE.read_text(encoding="utf-8")
    depart = texte.find(f"### {titre}")
    if depart < 0:
        raise SystemExit(f"section absente de FICHE-PLAY.md : ### {titre}")
    ouvrant = texte.index("```", depart) + 3
    ouvrant = texte.index("\n", ouvrant) + 1
    fermant = texte.index("```", ouvrant)
    return texte[ouvrant:fermant].strip("\n")


TITRE = _bloc("Titre")
DESCRIPTION_COURTE = _bloc("Description courte")
DESCRIPTION_LONGUE = _bloc("Description longue")

# L'ordre de cette liste **est** l'ordre d'affichage sur la fiche, et seules
# les trois premieres captures sont visibles dans un resultat de recherche
# sans faire defiler. Elles doivent donc porter les trois arguments, dans
# l'ordre : ce que l'app fait, qu'elle le fait sur l'appareil, et l'etendue
# du catalogue.
ASSETS = RACINE / "assets"
CAPTURES = ASSETS / "captures"

VISUELS = {
    "icon": [ASSETS / "icone-play-512.png"],
    "featureGraphic": [ASSETS / "feature-graphic-1024x500.png"],
    "phoneScreenshots": [
        CAPTURES / "01-accueil.png",
        CAPTURES / "02-fusion.png",
        CAPTURES / "03-recherche.png",
        CAPTURES / "04-apercu.png",
        CAPTURES / "05-proteger.png",
        CAPTURES / "06-organiser.png",
    ],
}


def limites() -> None:
    for nom, valeur, maxi in (
        ("titre", TITRE, 30),
        ("description courte", DESCRIPTION_COURTE, 80),
        ("description longue", DESCRIPTION_LONGUE, 4000),
    ):
        if len(valeur) > maxi:
            raise SystemExit(f"{nom} : {len(valeur)}/{maxi} — au-dessus de la limite")
        print(f"  {nom:<20} {len(valeur):>5}/{maxi}")


# --- Commandes --------------------------------------------------------------


class _Lecture(Exception):
    """Sortie propre d'un edit de consultation."""


def etat(s: requests.Session) -> None:
    with Edit(s) as e:
        fiche = verifier(s.get(e.url(f"listings/{LANGUE}")))
        print(f"Fiche actuelle ({LANGUE}) :")
        print(f"  titre  : {fiche.get('title')!r}")
        print(f"  courte : {fiche.get('shortDescription', '')[:70]!r}")
        details = verifier(s.get(e.url("details")))
        print(f"  contact: {details.get('contactWebsite')} / {details.get('contactEmail')}")

        print("Visuels :")
        for genre in (
            "icon",
            "featureGraphic",
            "phoneScreenshots",
            "sevenInchScreenshots",
            "tenInchScreenshots",
        ):
            images = verifier(s.get(e.url(f"listings/{LANGUE}/{genre}"))).get(
                "images", []
            )
            print(f"  {genre:<22} {len(images)}")

        bundles = verifier(s.get(e.url("bundles"))).get("bundles", [])
        print(f"App bundles : {[b['versionCode'] for b in bundles] or 'aucun'}")
        pistes = verifier(s.get(e.url("tracks")))
        for t in pistes.get("tracks", []):
            versions = [
                f"{r.get('status')} {r.get('versionCodes')}"
                for r in t.get("releases", [])
            ]
            print(f"  piste {t['track']:<12} {versions}")
        # Lecture seule : on abandonne plutot que de valider un edit vide.
        raise _Lecture()


def prochain_code(s: requests.Session) -> None:
    """Le versionCode a utiliser pour le prochain envoi.

    Play refuse deux fois le meme versionCode : on lit donc le plus grand code
    deja depose et on renvoie le suivant. L'integration continue s'en sert
    pour construire l'AAB avec `--build-number`, sans avoir a monter
    `pubspec.yaml` a la main a chaque merge.

    N'ecrit rien : l'edit n'est ouvert que pour lire la liste des bundles et
    il est abandonne, exactement comme dans [etat].
    """
    with Edit(s) as e:
        bundles = verifier(s.get(e.url("bundles"))).get("bundles", [])
        connus = [int(b["versionCode"]) for b in bundles]
        print(max(connus, default=0) + 1)
        raise _Lecture()


# Affirmations qui ne doivent JAMAIS revenir dans la fiche, parce qu'elles
# sont fausses. Le controle est ici et pas dans un commentaire : une remise en
# place par copier-coller ne se verrait pas.
#
# La lecon vient du compresseur video, dont la fiche est partie en ligne en
# affirmant « does not even request internet permission » alors que le
# manifeste la demandait. Trombone porte le meme piege en plus gros : elle
# declare INTERNET, elle affiche de la publicite, et son outil « page web vers
# PDF » va chercher une adresse. « Aucun envoi de vos documents » est vrai ;
# « fonctionne sans connexion » sans reserve ne l'est pas.
INTERDITS = (
    "aucune connexion",
    "sans aucune connexion",
    "aucune permission",
    "100 % hors ligne",
    "100% hors ligne",
    "entierement hors ligne",
    "entièrement hors ligne",
    "ne demande aucun acces",
    "ne demande aucun accès",
)


def _controler_affirmations(longue: str) -> None:
    bas = longue.lower()
    for interdit in INTERDITS:
        if interdit in bas:
            raise SystemExit(
                f"FICHE-PLAY.md contient a nouveau « {interdit} ».\n"
                "Affirmation retiree parce qu'elle est fausse : l'application\n"
                "declare INTERNET, affiche de la publicite, et son outil\n"
                "« page web vers PDF » va chercher une adresse. Ce qui est vrai\n"
                "et qu'il faut dire a la place : aucun document n'est envoye."
            )


def fiche(s: requests.Session) -> None:
    print("Longueurs :")
    limites()
    _controler_affirmations(DESCRIPTION_LONGUE)
    with Edit(s) as e:
        verifier(
            s.put(
                e.url(f"listings/{LANGUE}"),
                json={
                    "language": LANGUE,
                    "title": TITRE,
                    "shortDescription": DESCRIPTION_COURTE,
                    "fullDescription": DESCRIPTION_LONGUE,
                },
            )
        )
    print("Fiche mise a jour.")


def visuels(s: requests.Session) -> None:
    """Ne pousse que ce qui manque, et refuse d'ecraser le reste.

    La version Kwizu commencait par un DELETE de la categorie, faute de quoi
    une seconde execution empilait un deuxieme jeu de captures a la suite du
    premier. Mais un DELETE detruit du travail deja valide pour le remettre a
    l'identique — et si l'envoi echoue au milieu, la fiche reste sans visuel.
    Le compresseur a corrige en sautant les categories deja remplies ; c'est
    cette version-la qui est reprise ici.

    Pour remplacer un visuel deja en ligne, le supprimer depuis la Console.
    """
    with Edit(s) as e:
        for genre, fichiers in VISUELS.items():
            existants = verifier(s.get(e.url(f"listings/{LANGUE}/{genre}"))).get(
                "images", []
            )
            if existants:
                print(f"  {genre:<18} deja {len(existants)} image(s) — ignore")
                continue
            for f in fichiers:
                if not f.exists():
                    raise SystemExit(f"visuel introuvable : {f}")
                r = s.post(
                    e.url_televersement(f"listings/{LANGUE}/{genre}"),
                    params={"uploadType": "media"},
                    headers={"Content-Type": "image/png"},
                    data=f.read_bytes(),
                )
                verifier(r)
                print(f"  {genre:<18} {f.name}")
    print("Visuels envoyes.")


# Le site et l'adresse affiches sur la fiche. L'adresse est **publique** et
# sera moissonnee : une adresse dediee, jamais l'adresse personnelle.
SITE_CONTACT = "https://wrocketdev.github.io/trombone-app/"
EMAIL_CONTACT = "kwizustudio@gmail.com"


def _site_joignable(url: str) -> bool:
    """Le site de contact repond-il ?

    Le script de la belote porte cette cicatrice : `kwizu.wrocket.dev` etait
    encore declare sur la fiche alors qu'il rendait un HTTP 530. Un lien mort
    sur une fiche en production est un manquement au reglement Play, pas une
    coquille — et rien dans l'API ne le signale.

    On n'utilise pas la session Play ici : elle porte un jeton Bearer Google
    qu'il n'y a aucune raison d'envoyer a un site tiers.
    """
    try:
        r = requests.get(url, timeout=15, allow_redirects=True)
        return r.status_code < 400
    except requests.RequestException:
        return False


def contact(s: requests.Session) -> None:
    if not _site_joignable(SITE_CONTACT):
        raise SystemExit(
            f"{SITE_CONTACT} ne repond pas.\n\n"
            "Rien n'a ete ecrit. Publier une fiche qui pointe vers un lien\n"
            "mort est un manquement au reglement Play.\n"
            "Activer GitHub Pages sur le depot, ou corriger SITE_CONTACT."
        )
    with Edit(s) as e:
        avant = verifier(s.get(e.url("details")))
        print(f"  avant : {avant.get('contactWebsite')} / {avant.get('contactEmail')}")
        verifier(
            s.put(
                e.url("details"),
                json={
                    **avant,
                    "contactWebsite": SITE_CONTACT,
                    "contactEmail": EMAIL_CONTACT,
                },
            )
        )
        print(f"  apres : {SITE_CONTACT} / {EMAIL_CONTACT}")
    print("Coordonnees mises a jour.")


# La note de la release en cours. A mettre a jour a chaque version : elle
# n'est pas dans FICHE-PLAY.md car elle change a chaque envoi, pas a chaque
# refonte de fiche.
NOTES_RELEASE = "Traductions complètes en 25 langues et améliorations de stabilité."

PISTES = ("internal", "alpha", "beta", "production")

# **La publication se fait piste par piste, jamais en bloc.** Kwizu bascule ses
# quatre pistes en `completed` d'un seul edit ; le compresseur video a du y
# renoncer, parce que le compte exige un test ferme de quatorze jours avec
# douze testeurs avant d'ouvrir `beta` et `production`. Servir les quatre
# ensemble ferait echouer la moitie des appels au milieu d'un edit.
#
# Trombone est une application neuve sur ce meme compte : elle part donc sur
# `alpha` seule, et `deployer` prend la piste en argument pour la suite.
PISTE = "alpha"  # « Tests fermes - Alpha » dans la Console


def _televerser(s: requests.Session, e: Edit, chemin: str) -> int:
    aab = Path(chemin)
    if not aab.exists():
        raise SystemExit(f"introuvable : {aab}")
    r = s.post(
        e.url_televersement("bundles"),
        params={"uploadType": "media"},
        headers={"Content-Type": "application/octet-stream"},
        data=aab.read_bytes(),
    )
    info = verifier(r)
    print(f"  app bundle recu, versionCode {info['versionCode']}")
    return info["versionCode"]


def _release_existante(s: requests.Session, e: Edit, piste: str) -> dict:
    """La release en place sur `piste`, relue pour etre reecrite telle quelle.

    Un PUT sur une piste remplace **toute** sa liste de releases : omettre
    `name` ou `releaseNotes` les effacerait sans rien signaler. On relit donc
    avant d'ecrire, et on ne touche qu'aux champs voulus.
    """
    piste_actuelle = verifier(s.get(e.url(f"tracks/{piste}")))
    releases = piste_actuelle.get("releases") or []
    return dict(releases[0]) if releases else {}


def bundle(s: requests.Session, chemin: str) -> None:
    """Depose l'AAB et l'accroche en brouillon a la piste [PISTE]."""
    with Edit(s) as e:
        code = _televerser(s, e, chemin)
        release = _release_existante(s, e, PISTE)
        release["versionCodes"] = [str(code)]
        release["status"] = "draft"
        release.setdefault(
            "releaseNotes", [{"language": LANGUE, "text": NOTES_RELEASE}]
        )
        verifier(
            s.put(e.url(f"tracks/{PISTE}"), json={"track": PISTE, "releases": [release]})
        )
        print(f"  {PISTE} <- brouillon {release.get('name', '(sans nom)')} [{code}]")
    print(
        "Bundle depose en brouillon. Il reste a inscrire les testeurs, puis a "
        "confirmer et envoyer pour examen."
    )


def publier(s: requests.Session) -> None:
    """Fait passer la release brouillon de [PISTE] en `completed`.

    Ne televerse rien : le binaire est deja depose par `bundle`. Passer en
    `completed`, c'est envoyer la release en examen Google puis la rendre
    disponible aux testeurs inscrits — geste sortant et difficile a defaire,
    d'ou la commande separee.
    """
    with Edit(s) as e:
        release = _release_existante(s, e, PISTE)
        if not release:
            raise SystemExit(f"aucune release sur {PISTE} — lancer `bundle` d'abord")
        if not release.get("versionCodes"):
            raise SystemExit(f"la release de {PISTE} n'a pas de binaire")
        if release.get("status") == "completed":
            raise SystemExit(f"{PISTE} est deja en `completed` — rien a faire")

        release["status"] = "completed"
        release.pop("userFraction", None)  # incompatible avec un deploiement complet
        verifier(
            s.put(e.url(f"tracks/{PISTE}"), json={"track": PISTE, "releases": [release]})
        )
        print(f"  {PISTE} <- completed {release['versionCodes']}")
    print("Release envoyee en examen, puis disponible aux testeurs inscrits.")


def deployer(s: requests.Session, piste: str, code: str) -> None:
    """Rattache un binaire DEJA depose a une piste, directement en `completed`.

    Un meme AAB ne se televerse qu'une fois — Play refuse un second envoi du
    meme versionCode. Diffuser un binaire existant sur une piste de plus,
    c'est donc ecrire la piste, pas renvoyer le fichier.

    La piste est validee contre [PISTES] : une faute de frappe creerait une
    piste inconnue au lieu d'echouer, et personne ne s'en apercevrait avant de
    chercher pourquoi les testeurs n'ont rien recu.
    """
    if piste not in PISTES:
        raise SystemExit(f"piste inconnue : {piste!r} — attendu {' | '.join(PISTES)}")

    with Edit(s) as e:
        connus = [
            str(b["versionCode"])
            for b in verifier(s.get(e.url("bundles"))).get("bundles", [])
        ]
        if str(code) not in connus:
            raise SystemExit(
                f"versionCode {code} jamais depose (connus : {connus or 'aucun'}) — "
                "lancer `bundle` d'abord."
            )

        release = _release_existante(s, e, piste) or {"name": "1.0.0"}
        if (
            release.get("versionCodes") == [str(code)]
            and release.get("status") == "completed"
        ):
            raise SystemExit(f"{piste} diffuse deja {code} en completed — rien a faire")

        avant = release.get("versionCodes") or "(vide)"
        release["versionCodes"] = [str(code)]
        release["status"] = "completed"
        release.pop("userFraction", None)
        release.setdefault(
            "releaseNotes", [{"language": LANGUE, "text": NOTES_RELEASE}]
        )
        verifier(
            s.put(e.url(f"tracks/{piste}"), json={"track": piste, "releases": [release]})
        )
        print(f"  {piste:<12} {avant} -> completed ['{code}']")
    print(f"Piste {piste} diffuse maintenant le versionCode {code}.")


def main() -> None:
    if len(sys.argv) < 2:
        raise SystemExit(__doc__)
    commande = sys.argv[1]
    s = session()
    try:
        if commande == "etat":
            etat(s)
        elif commande == "prochain-code":
            prochain_code(s)
        elif commande == "fiche":
            fiche(s)
        elif commande == "visuels":
            visuels(s)
        elif commande == "contact":
            contact(s)
        elif commande == "bundle":
            if len(sys.argv) < 3:
                raise SystemExit("chemin de l'AAB attendu")
            bundle(s, sys.argv[2])
        elif commande == "publier":
            publier(s)
        elif commande == "deployer":
            if len(sys.argv) < 4:
                raise SystemExit("piste et versionCode attendus")
            deployer(s, sys.argv[2], sys.argv[3])
        else:
            raise SystemExit(__doc__)
    except _Lecture:
        pass


if __name__ == "__main__":
    main()
