import 'package:flutter/material.dart';

import 'app.dart';
import 'core/ads/ad_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Lancé sans être attendu : la première publicité ne peut de toute façon
  // paraître qu'après un export réussi et acquitté. Rien ne justifie de
  // retarder le premier écran pour la régie.
  AdService.instance.init();
  runApp(const FusionPdfApp());
}
