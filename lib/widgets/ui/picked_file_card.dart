import 'package:flutter/material.dart';

/// Le bandeau « voici le fichier sur lequel vous travaillez ».
///
/// Huit écrans portaient chacun leur copie de cette carte, et chaque copie
/// gardait, en branche morte, l'état « aucun fichier choisi » d'avant le
/// passage à `EmptyState` : `picked == null ? 'Choisir un PDF' : picked.name`,
/// écrit à l'intérieur d'une branche où `picked` ne peut pas être nul. Quatre-
/// vingt-dix avertissements de code mort en tout — sans effet visible, mais
/// c'est exactement le genre de résidu qui laisse croire qu'un état existe
/// encore alors qu'il ne peut plus s'afficher.
///
/// Le nom est tronqué par ellipse, ce que les copies ne faisaient pas. Les noms
/// réels ne ressemblent pas à `document.pdf` : sur un téléphone d'usage on
/// trouve `2026-03-07_Facture_de_primes_n_20665240303.pdf`. Sans ellipse, la
/// rangée passait à deux lignes et déformait la carte.
///
/// **Une seule action, « Changer ».** Le passage sur appareil a montré trois
/// grammaires pour le même emplacement selon l'écran : une croix qui retire
/// (PDF vers Word), un lien « Changer » qui remplace (Protéger), une rangée
/// nue sans carte (Organiser). La croix était en outre le mauvais geste : elle
/// ramène à l'état vide, d'où il faut re-toucher « Choisir » — deux gestes
/// pour ce que « Changer » fait en un. Sur ces écrans, on ne veut jamais *pas*
/// de fichier ; on en veut un autre.
///
/// [onClear] subsiste pour les rares écrans qui savent vraiment revenir à
/// vide, mais n'est plus la voie normale.
class PickedFileCard extends StatelessWidget {
  const PickedFileCard({
    super.key,
    required this.name,
    required this.subtitle,
    this.icon = Icons.picture_as_pdf_outlined,
    this.onChange,
    this.onClear,
    this.busy = false,
  });

  final String name;
  final String subtitle;
  final IconData icon;

  /// Remplace le fichier par un autre. C'est l'action attendue.
  final VoidCallback? onChange;

  /// Retire le fichier et ramène l'écran à son état vide. Réservé aux écrans
  /// qui savent le faire.
  final VoidCallback? onClear;

  final bool busy;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(name, maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: Text(subtitle, maxLines: 1, overflow: TextOverflow.ellipsis),
        onTap: busy ? null : onChange,
        trailing: onChange != null
            ? TextButton(
                onPressed: busy ? null : onChange,
                child: const Text('Changer', maxLines: 1),
              )
            : onClear == null
            ? null
            : IconButton(
                tooltip: 'Retirer ce fichier',
                icon: const Icon(Icons.close),
                onPressed: busy ? null : onClear,
              ),
      ),
    );
  }
}
