// Place fonts/Func.ttf in your fonts/ directory and
// add the following to your pubspec.yaml
// flutter:
//   fonts:
//    - family: Func
//      fonts:
//       - asset: fonts/Func.ttf
import 'package:flutter/widgets.dart';

class Func {
  Func._();

  static const String _fontFamily = 'Func';

  static const IconData edit_icon = IconData(0xe900, fontFamily: _fontFamily);
  static const IconData clothes_hang= IconData(0xe901, fontFamily: _fontFamily);
  static const IconData trash_bin = IconData(0xe902, fontFamily: _fontFamily);
  static const IconData house_main = IconData(0xe903, fontFamily: _fontFamily);
  static const IconData add_circle = IconData(0xe904, fontFamily: _fontFamily);
}
