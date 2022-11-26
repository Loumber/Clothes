// Place fonts/clothes.ttf in your fonts/ directory and
// add the following to your pubspec.yaml
// flutter:
//   fonts:
//    - family: clothes
//      fonts:
//       - asset: fonts/clothes.ttf
import 'package:flutter/widgets.dart';

class Clothes {
  Clothes._();

  static const String _fontFamily = 'clothes';

  static const IconData scarf = IconData(0xe901, fontFamily: _fontFamily);
  static const IconData shoes = IconData(0xe900, fontFamily: _fontFamily);
  static const IconData jacket = IconData(0xe902, fontFamily: _fontFamily);
  static const IconData jeans = IconData(0xe903, fontFamily: _fontFamily);
  static const IconData tshirt = IconData(0xe904, fontFamily: _fontFamily);
}
