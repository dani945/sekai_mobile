import 'package:flutter/material.dart';

import 'i_colors.dart';
import 'i_text_theme.dart';

class IButtonTheme {
  static ElevatedButtonThemeData elevatedThemeData() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Palette.primary,
        foregroundColor: Palette.white,
        disabledBackgroundColor: Palette.neutral50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        textStyle: ITextTheme.textThemeMaterial3().labelMedium,
      ),
    );
  }

  static OutlinedButtonThemeData outlinedTHemeData() {
    return OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 0,
        textStyle: ITextTheme.textThemeMaterial3().labelMedium,
        foregroundColor: Palette.primary,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      ).copyWith(side: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return const BorderSide(color: Palette.secondary);
          }
          return const BorderSide(color: Palette.primary);
        },
      )),
    );
  }

  static TextButtonThemeData textButtonThemeData() {
    return TextButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        textStyle: ITextTheme.textThemeMaterial3().labelMedium,
        foregroundColor: Palette.primary,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      ),
    );
  }
}
