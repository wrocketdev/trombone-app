import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'app_fonts.dart';

import 'package:trombone/l10n/l10n.dart';
import 'package:trombone/screens/compare_screen.dart';
import 'package:trombone/screens/crop_screen.dart';
import 'package:trombone/screens/edit_screen.dart';
import 'package:trombone/screens/excel_to_pdf_screen.dart';
import 'package:trombone/screens/html_to_pdf_screen.dart';
import 'package:trombone/screens/images_to_pdf_screen.dart';
import 'package:trombone/screens/merge_screen.dart';
import 'package:trombone/screens/ocr_screen.dart';
import 'package:trombone/screens/organize_screen.dart';
import 'package:trombone/screens/page_numbers_screen.dart';
import 'package:trombone/screens/pdf_to_excel_screen.dart';
import 'package:trombone/screens/pdf_to_images_screen.dart';
import 'package:trombone/screens/pdf_to_pptx_screen.dart';
import 'package:trombone/screens/pdf_to_word_screen.dart';
import 'package:trombone/screens/pdfa_screen.dart';
import 'package:trombone/screens/pptx_to_pdf_screen.dart';
import 'package:trombone/screens/protect_screen.dart';
import 'package:trombone/screens/recto_verso_screen.dart';
import 'package:trombone/screens/redact_screen.dart';
import 'package:trombone/screens/repair_screen.dart';
import 'package:trombone/screens/sign_screen.dart';
import 'package:trombone/screens/unlock_screen.dart';
import 'package:trombone/screens/watermark_screen.dart';
import 'package:trombone/theme/theme.dart';

/// Chaque écran outil, monté à trois largeurs et deux échelles de police.
///
/// Ce fichier existe parce que le contrôle à l'œil ne tient pas à 26 écrans :
/// un libellé de bouton qui passe sur deux lignes ou une rangée qui déborde de
/// trois pixels ne se voient que sur l'appareil où on a pensé à regarder. Le
/// harnais de test, lui, lève une exception de mise en page à chaque
/// débordement — il suffit de la remonter.
///
/// `ScanScreen` est absent : il ouvre la caméra dès `initState`, ce qu'un test
/// unitaire ne peut pas satisfaire. Il reste à vérifier sur appareil.
void main() {
  setUpAll(loadAppFonts);

  final screens = <String, Widget Function()>{
    'Fusionner': () => const MergeScreen(),
    'Recto-verso': () => const RectoVersoScreen(),
    'Organiser': () => const OrganizeScreen(),
    'Images vers PDF': () => const ImagesToPdfScreen(),
    'Excel vers PDF': () => const ExcelToPdfScreen(),
    'PowerPoint vers PDF': () => const PptxToPdfScreen(),
    'Page web vers PDF': () => const HtmlToPdfScreen(),
    'PDF vers Word': () => const PdfToWordScreen(),
    'PDF vers Excel': () => const PdfToExcelScreen(),
    'PDF vers PowerPoint': () => const PdfToPptxScreen(),
    'PDF vers Images': () => const PdfToImagesScreen(),
    'OCR': () => const OcrScreen(),
    'PDF/A': () => const PdfAScreen(),
    'Protéger': () => const ProtectScreen(),
    'Déverrouiller': () => const UnlockScreen(),
    'Réparer': () => const RepairScreen(),
    'Caviarder': () => const RedactScreen(),
    'Éditer': () => const EditScreen(),
    'Signer': () => const SignScreen(),
    'Filigrane': () => const WatermarkScreen(),
    'Numéros de page': () => const PageNumbersScreen(),
    'Rogner': () => const CropScreen(),
    'Comparer': () => const CompareScreen(),
  };

  final cases = <String, ({Size size, double scale})>{
    'petit téléphone 320': (size: Size(320, 640), scale: 1.0),
    'Galaxy S24 Ultra 384': (size: Size(384, 832), scale: 1.0),
    'téléphone courant 412': (size: Size(412, 915), scale: 1.0),
    'police agrandie 1,3×': (size: Size(360, 800), scale: 1.3),
  };

  screens.forEach((name, build) {
    group(name, () {
      cases.forEach((caseName, c) {
        testWidgets(caseName, (WidgetTester tester) async {
          tester.view.physicalSize = c.size;
          tester.view.devicePixelRatio = 1.0;
          addTearDown(tester.view.reset);

          await tester.pumpWidget(
            MediaQuery(
              data: MediaQueryData(textScaler: TextScaler.linear(c.scale)),
              child: MaterialApp(
                // Sans les delegues, `L.of(context)` rend nul et tout widget qui lit
                // un libelle jette. La langue est fixee au francais : c'est le
                // modele, et une mesure de largeur n'a de sens que dans une langue
                // connue.
                locale: const Locale('fr'),
                localizationsDelegates: L.localizationsDelegates,
                // `supportedLocales` vaut en_US par defaut ; la resolution y
                // retomberait et le delegue ne saurait pas la servir.
                supportedLocales: L.supportedLocales,
                theme: AppTheme.light(),
                home: build(),
              ),
            ),
          );
          await tester.pump();

          expect(tester.takeException(), isNull);
        });
      });
    });
  });
}
