import 'package:flutter/material.dart';

import '../storage/i_storage.dart';
import '../util/i_constant.dart';
import 'i_app_bar_theme.dart';
import 'i_button_theme.dart';
import 'i_colors.dart';
import 'i_croll_bar_theme.dart';
import 'i_input_decoration_theme.dart';
import 'i_text_theme.dart';

enum IThemeStyle {
  light("light"),
  dark("dark");

  final String value;

  const IThemeStyle(this.value);
}

class IThemeController extends ChangeNotifier {
  ThemeData? themeDataLight;

  ThemeData? themeDataDark;

  Future<void> init(String? theme) async {
    IThemeStyle iThemeStyle = IThemeStyle.light;
    if (theme == IThemeStyle.light.value) {
      iThemeStyle = IThemeStyle.light;
    } else if (theme == IThemeStyle.dark.value) {
      iThemeStyle = IThemeStyle.dark;
    }

    switch (await IStorage.getString(IConstant.themeMode)) {
      case "light":
        themeDataLight = _light(iThemeStyle);
        notifyListeners();
        break;
      case "dark":
        themeDataLight = _dark(iThemeStyle);
        notifyListeners();
        break;
      default:
        themeDataLight = _light(iThemeStyle);
        notifyListeners();
    }
    // themeDataLight = _light(iThemeStyle);
    // themeDataDark = _dark(iThemeStyle);
    // notifyListeners();
  }

  Future<void> changeTheme(IThemeStyle iThemeStyle) async {
    IStorage.setString(IConstant.themeMode, iThemeStyle.value);
    switch (iThemeStyle.value) {
      case "light":
        themeDataLight = _light(iThemeStyle);
        notifyListeners();
        break;
      case "dark":
        themeDataLight = _dark(iThemeStyle);
        notifyListeners();
        break;
      default:
        themeDataLight = _light(iThemeStyle);
        notifyListeners();
    }
    // themeDataLight = _light(iThemeStyle);
    // themeDataDark = _dark(iThemeStyle);
  }

  ThemeData _light(IThemeStyle iThemeStyle) {
    return ThemeData(
      useMaterial3: true,
      primaryColor: Palette.primaryLight(iThemeStyle),
      primaryColorDark: Palette.primaryDark(iThemeStyle),
      disabledColor: Palette.disable,
      appBarTheme: IAppBarTheme.light(),
      textTheme: ITextTheme.textThemeMaterial3(),
      elevatedButtonTheme: IButtonTheme.elevatedThemeData(),
      outlinedButtonTheme: IButtonTheme.outlinedTHemeData(),
      textButtonTheme: IButtonTheme.textButtonThemeData(),
      inputDecorationTheme: IInputDecorationTheme.primary(),
      scrollbarTheme: IScrollbarTheme.scrollbarThemeData(),
      scaffoldBackgroundColor: Palette.primaryLight(iThemeStyle),
      colorScheme: ColorScheme.light(
        primary: Palette.primaryLight(iThemeStyle),
        secondary: Palette.secondary,
      ),
      iconTheme: const IconThemeData(
        color: Palette.neutral80,
        size: 24,
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return Palette.black; // Warna saat dipilih
          }
          return Colors.grey; // Warna default
        }),
        overlayColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) {
            return Palette.black.withOpacity(0.1); // Warna saat hover
          }
          return null;
        }),
      ),
    );
  }

  ThemeData _dark(IThemeStyle iThemeStyle) {
    return ThemeData(
      useMaterial3: true,
      disabledColor: Palette.disable,
      primaryColor: Palette.primaryLight(iThemeStyle),
      primaryColorDark: Palette.primaryDark(iThemeStyle),
      appBarTheme: IAppBarTheme.dark(),
      textTheme: ITextTheme.textThemeMaterial3(),
      elevatedButtonTheme: IButtonTheme.elevatedThemeData(),
      outlinedButtonTheme: IButtonTheme.outlinedTHemeData(),
      scaffoldBackgroundColor: Palette.primaryDark(iThemeStyle),
      iconTheme: const IconThemeData(
        color: Palette.neutral80,
        size: 24,
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return Palette.black; // Warna saat dipilih
          }
          return Colors.grey; // Warna default
        }),
        overlayColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) {
            return Palette.black.withOpacity(0.1); // Warna saat hover
          }
          return null;
        }),
      ),
    );
  }
}
