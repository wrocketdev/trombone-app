import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// Charge les vraies fontes de l'application dans le harnais de test.
///
/// Sans cet appel, Flutter compose avec une fonte de repli dont **chaque
/// glyphe occupe un carré** d'un cadratin. « Compresser » y mesure dix
/// cadratins, là où Inter en demande environ cinq et demi. Toute mesure de
/// largeur faite sans les vraies fontes est donc fausse — et suffisamment
/// fausse pour faire échouer un test sur une mise en page parfaitement saine,
/// ou, plus grave, pour accepter un libellé qui casse sur l'appareil.
///
/// À appeler dans un `setUpAll` de tout test qui mesure du texte.
Future<void> loadAppFonts() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  const families = <String, List<String>>{
    'Inter': [
      'assets/fonts/Inter-400.ttf',
      'assets/fonts/Inter-500.ttf',
      'assets/fonts/Inter-600.ttf',
      'assets/fonts/Inter-700.ttf',
    ],
    'Plus Jakarta Sans': [
      'assets/fonts/PlusJakartaSans-600.ttf',
      'assets/fonts/PlusJakartaSans-700.ttf',
      'assets/fonts/PlusJakartaSans-800.ttf',
    ],
  };

  for (final entry in families.entries) {
    final loader = FontLoader(entry.key);
    for (final path in entry.value) {
      final file = File(path);
      if (!file.existsSync()) {
        throw StateError(
          'Fonte introuvable : $path — le test de mise en page mesurerait '
          'avec la fonte de repli et ses résultats seraient faux.',
        );
      }
      final bytes = await file.readAsBytes();
      loader.addFont(
        Future.value(ByteData.view(Uint8List.fromList(bytes).buffer)),
      );
    }
    await loader.load();
  }
}
