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
    python play_api.py fiche       (ECRIT les textes depuis FICHE-PLAY.md)
    python play_api.py contact     (ECRIT le site et l'e-mail de contact)
    python play_api.py visuels     (ECRIT icone, graphisme, captures)
    python play_api.py bundle <chemin.aab>   (brouillon, canal interne)
    python play_api.py publier <chemin.aab>  (ECRIT : completed, 4 pistes)

Chaque commande ouvre un « edit », applique ses changements et le valide.
Un edit non valide expire tout seul : en cas d'erreur en cours de route,
rien n'est ecrit.
"""

from __future__ import annotations

import sys
from pathlib import Path

import requests
from google.auth.transport.requests import Request
from google.oauth2 import service_account

CLE = Path(r"C:\Users\thomas\cles-android\play-publisher.json")

# Definitif. Il a ete choisi pour ne nommer aucun outil en particulier :
# l'identifiant precedent, `com.fusionpdf.fusion_pdf`, aurait fige « fusion »
# dans une application qui propose vingt-quatre outils.
PAQUET = "fr.trombone.pdf"

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
VISUELS = {
    "icon": [RACINE / "visuels" / "icone.png"],
    "featureGraphic": [RACINE / "visuels" / "graphisme.png"],
    "phoneScreenshots": [
        RACINE / "visuels" / f"capture{n:02d}.png" for n in range(1, 9)
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
        pistes = verifier(s.get(e.url("tracks")))
        for t in pistes.get("tracks", []):
            versions = [
                f"{r.get('status')} {r.get('versionCodes')}"
                for r in t.get("releases", [])
            ]
            print(f"  piste {t['track']:<12} {versions}")
        # Lecture seule : on abandonne plutot que de valider un edit vide.
        raise _Lecture()


def fiche(s: requests.Session) -> None:
    print("Longueurs :")
    limites()
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
    with Edit(s) as e:
        for genre, fichiers in VISUELS.items():
            # Sans ce menage, chaque execution empilerait un second jeu de
            # captures a la suite du premier.
            s.delete(e.url(f"listings/{LANGUE}/{genre}"))
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
EMAIL_CONTACT = "wrocketdev@gmail.com"


def contact(s: requests.Session) -> None:
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
NOTES_RELEASE = "Premiere version."

# Les quatre pistes, toutes servies a chaque publication. La lecon de Kwizu :
# un testeur inscrit recoit la version de **sa** piste, et une piste oubliee
# avec un vieux `completed` prime sur la production. Basculer la production
# ne suffit pas.
PISTES = ("production", "beta", "alpha", "internal")


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


def bundle(s: requests.Session, chemin: str) -> None:
    with Edit(s) as e:
        code = _televerser(s, e, chemin)
        verifier(
            s.put(
                e.url("tracks/internal"),
                json={
                    "track": "internal",
                    "releases": [
                        {
                            "versionCodes": [str(code)],
                            "status": "draft",
                            "releaseNotes": [
                                {"language": LANGUE, "text": NOTES_RELEASE}
                            ],
                        }
                    ],
                },
            )
        )
    print("Bundle depose en brouillon sur le canal interne.")


def publier(s: requests.Session, chemin: str) -> None:
    """Televerse l'AAB et le met en `completed` sur les quatre pistes, dans
    un seul edit — donc un seul commit, aucune fenetre d'incoherence."""
    with Edit(s) as e:
        code = _televerser(s, e, chemin)
        for piste in PISTES:
            verifier(
                s.put(
                    e.url(f"tracks/{piste}"),
                    json={
                        "track": piste,
                        "releases": [
                            {
                                "versionCodes": [str(code)],
                                "status": "completed",
                                "releaseNotes": [
                                    {"language": LANGUE, "text": NOTES_RELEASE}
                                ],
                            }
                        ],
                    },
                )
            )
            print(f"  {piste:<12} completed [{code}]")
    print(f"Version {code} publiee sur les quatre pistes.")


def main() -> None:
    if len(sys.argv) < 2:
        raise SystemExit(__doc__)
    commande = sys.argv[1]
    s = session()
    try:
        if commande == "etat":
            etat(s)
        elif commande == "fiche":
            fiche(s)
        elif commande == "visuels":
            visuels(s)
        elif commande == "contact":
            contact(s)
        elif commande == "bundle":
            bundle(s, sys.argv[2])
        elif commande == "publier":
            publier(s, sys.argv[2])
        else:
            raise SystemExit(__doc__)
    except _Lecture:
        pass


if __name__ == "__main__":
    main()
