import 'package:flutter/material.dart';

import 'i_colors.dart';

class IAppBarTheme {
  static AppBarTheme light() {
    return const AppBarTheme(
      backgroundColor: Palette.blueGrey,
      foregroundColor: Palette.black,
    );
    // switch (iThemeStyle) {
    //   case IThemeStyle.yellow:
    //     return const AppBarTheme(backgroundColor: Colors.yellow);
    //   case IThemeStyle.red:
    //     return  AppBarTheme(backgroundColor: IColors.primary);
    //   default:
    //     return const AppBarTheme(backgroundColor: Colors.red);
    // }
  }

  static AppBarTheme dark() {
    return const AppBarTheme(
      backgroundColor: Palette.disable,
      foregroundColor: Palette.white,
    );
    // switch (iThemeStyle) {
    //   case IThemeStyle.yellow:
    //     return AppBarTheme(backgroundColor: Colors.yellow[900]);
    //   case IThemeStyle.red:
    //     return AppBarTheme(backgroundColor: Colors.red[900]);
    //   default:
    //     return const AppBarTheme(backgroundColor: Colors.red);
    // }
  }
}
