# -*- coding: utf-8 -*-
"""Rend les visuels de la fiche Play et les icônes de lanceur de Trombone.

Repris de `compresseur-video/publication/assets/generer.py`. Les visuels sont
écrits en HTML/CSS et rendus par le moteur d'Edge en mode headless, à deux fois
la taille finale puis réduits sous Pillow : ni le tracé de primitives ni Pillow
seul ne donnent la police du produit, les dégradés ou l'antialiasing du moteur.

    python publication/assets/generer.py

Dépendances : Pillow, et Edge ou Chrome installé.
"""

import subprocess
import sys
import tempfile
from pathlib import Path

from PIL import Image

ICI = Path(__file__).resolve().parent
RACINE = ICI.parents[1]
RES = RACINE / "android" / "app" / "src" / "main" / "res"

NAVIGATEURS = [
    Path(r"C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"),
    Path(r"C:\Program Files\Microsoft\Edge\Application\msedge.exe"),
    Path(r"C:\Program Files\Google\Chrome\Application\chrome.exe"),
    Path(r"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"),
]

ECHELLE = 2  # rendu à 2x puis réduction : c'est là que se gagne la netteté


def navigateur():
    for p in NAVIGATEURS:
        if p.exists():
            return p
    sys.exit("Ni Edge ni Chrome trouvé — impossible de rendre les visuels.")


def rendre(html, largeur, hauteur, sortie, transparent=False):
    """Capture `html` en (largeur x hauteur) CSS, à ECHELLE fois la
    résolution, puis réduit à la taille demandée."""
    with tempfile.TemporaryDirectory() as profil:
        brut = Path(profil) / "brut.png"
        cmd = [
            str(navigateur()),
            "--headless=new",
            "--disable-gpu",
            "--hide-scrollbars",
            "--allow-file-access-from-files",
            "--no-first-run",
            f"--user-data-dir={profil}",
            f"--force-device-scale-factor={ECHELLE}",
            f"--window-size={largeur},{hauteur}",
            f"--screenshot={brut}",
        ]
        if transparent:
            cmd.append("--default-background-color=00000000")
        cmd.append((ICI / html).as_uri())

        r = subprocess.run(cmd, capture_output=True, timeout=120)
        if not brut.exists():
            sys.exit(
                f"Rendu échoué pour {html}\n"
                f"{r.stderr.decode('utf-8', 'replace')[:800]}"
            )

        img = Image.open(brut).convert("RGBA")
        if img.size != (largeur, hauteur):
            img = img.resize((largeur, hauteur), Image.LANCZOS)
        sortie.parent.mkdir(parents=True, exist_ok=True)
        # Les visuels de fiche Play doivent être opaques ; la couche de premier
        # plan d'une icône adaptative doit garder son alpha.
        if transparent:
            img.save(sortie, "PNG", optimize=True)
        else:
            img.convert("RGB").save(sortie, "PNG", optimize=True)
        print(
            f"  {sortie.relative_to(RACINE)}  {largeur}x{hauteur}  "
            f"{sortie.stat().st_size // 1024} Ko"
        )
        return img


if __name__ == "__main__":
    print("Fiche Play :")
    icone = rendre("icone.html", 512, 512, ICI / "icone-play-512.png")
    rendre("feature.html", 1024, 500, ICI / "feature-graphic-1024x500.png")

    # L'icône adaptative n'existait pas : le projet n'avait que les mipmaps
    # héritées du gabarit Flutter, et aucun `mipmap-anydpi-v26`. Sans elle,
    # tout lanceur depuis Android 8 applique lui-même un masque au PNG carré,
    # ce qui rogne les coins de la pince.
    print("Lanceur (couche de premier plan, adaptative) :")
    rendre(
        "icone-foreground.html",
        432,
        432,
        RES / "drawable" / "ic_launcher_foreground.png",
        transparent=True,
    )

    # Repli hérité, lu par Play et par les lanceurs anterieurs à Android 8.
    print("Lanceur (repli hérité) :")
    for dossier, cote in [
        ("mipmap-mdpi", 48),
        ("mipmap-hdpi", 72),
        ("mipmap-xhdpi", 96),
        ("mipmap-xxhdpi", 144),
        ("mipmap-xxxhdpi", 192),
    ]:
        chemin = RES / dossier / "ic_launcher.png"
        icone.convert("RGB").resize((cote, cote), Image.LANCZOS).save(
            chemin, "PNG", optimize=True
        )
        print(f"  {chemin.relative_to(RACINE)}  {cote}x{cote}")
