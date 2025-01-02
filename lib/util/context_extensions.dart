import 'package:flutter/material.dart';

import '../theme/i_text_theme.dart';

extension ISizeExtensions on BuildContext {
  //=========== color ===================
  Color get primaryColor => Theme.of(this).primaryColor;

  Color get disableColor => Theme.of(this).disabledColor;

  Color get errorColor => Theme.of(this).colorScheme.error;

  //=========== Typography =============
  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;

  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;

  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;

  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;

  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;

  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;

  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;

  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;

  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;

  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;

  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;

  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;

  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;

  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;

  TextStyle? get body2 => Theme.of(this).textTheme.bodyMedium;

  TextStyle? get body5 => Theme.of(this).textTheme.bodyLarge;

  TextStyle? get headline1 => ITextTheme.textThemeMaterial2().displayLarge;

  TextStyle? get headline2 => ITextTheme.textThemeMaterial2().displayMedium;

  TextStyle? get headline3 => ITextTheme.textThemeMaterial2().displaySmall;

  TextStyle? get headline4 => ITextTheme.textThemeMaterial2().headlineMedium;

  TextStyle? get headline5 => ITextTheme.textThemeMaterial2().headlineSmall;

  TextStyle? get subtitle1 => ITextTheme.textThemeMaterial2().titleMedium;

  TextStyle? get subtitle2 => ITextTheme.textThemeMaterial2().titleSmall;

  TextStyle? get button => ITextTheme.textThemeMaterial2().labelLarge;

  TextStyle? get caption => ITextTheme.textThemeMaterial2().bodySmall;

  TextStyle? get overline => ITextTheme.textThemeMaterial2().labelSmall;

  //======= Size =========
  MediaQueryData get iMediaQuery => MediaQuery.of(this);

  Size get iSize => MediaQuery.of(this).size;

  double mQWidth(double number) => iSize.width * number;

  double mQHeight(double number) => iSize.height * number;

  ///ini merupakan SizeBox dengat height. [size] defaultnya adalah [padding2]
  Widget sbHeight({double? size}) {
    return SizedBox(height: size ?? 16);
  }

  ///ini merupakan SizeBox dengat width. [size] defaultnya adalah [padding2]
  Widget sbWidth({double? size}) {
    return SizedBox(width: size ?? 16);
  }
}
