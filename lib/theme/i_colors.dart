import 'package:flutter/material.dart';

import 'i_theme.dart';

class Palette {
  Palette._();

  static const Color neutral10 = Color(0xFFFFFFFF);
  static const Color neutral20 = Color(0xFFF5F5F5);
  static const Color neutral30 = Color(0xFFEDEDED);
  static const Color neutral40 = Color(0xFFE0E0E0);
  static const Color neutral50 = Color(0xFFC2C2C2);
  static const Color neutral60 = Color(0xFF9E9E9E);
  static const Color neutral70 = Color(0xFF757575);
  static const Color neutral80 = Color(0xFF616161);
  static const Color neutral90 = Color(0xFF404040);
  static const Color neutral100 = Color(0xFF0A0A0A);

  static const Color white = Color(0xFFFFFFFF);

  static const Color secondary = Color(0xFF289672);
  static const primary = Color.fromRGBO(40, 150, 114, 1);
  static const Color orange = Color(0xFFF2994A);
  static const Color red = Color(0xFFB11016);
  static const Color black = Color(0xFF1F1D20);
  static const Color blackGrey = Color(0xFF444444);

  static const Color blueGrey = Color(0xFFFAFCFF);
  static const Color grey = Color(0xFFE8EEF7);
  static const Color greyDivider = Color(0xFFD9D9D9);
  static const Color blue1 = Color(0xFFF1F3F5);
  static const Color fontGreyProfile = Color(0xFF444444);
  static const Color readonly = Color(0xFFE8EEF6);

  static const Color disable = Color(0xFF828282);

  static Color primaryLight(IThemeStyle iThemeStyle) {
    switch (iThemeStyle) {
      case IThemeStyle.light:
        return blueGrey;
      case IThemeStyle.dark:
        return disable;
      default:
        return blueGrey;
    }
  }

  static Color primaryDark(IThemeStyle iThemeStyle) {
    switch (iThemeStyle) {
      case IThemeStyle.light:
        return blueGrey;
      case IThemeStyle.dark:
        return disable;
      default:
        return blueGrey;
    }
  }
}

// class IColors extends ThemeExtension<IColors>{
//   @override
//   ThemeExtension<IColors> copyWith() {
//
//     throw UnimplementedError();
//   }
//
//   @override
//   ThemeExtension<IColors> lerp(ThemeExtension<IColors>? other, double t) {
//     return this;
//   }
//
// }
