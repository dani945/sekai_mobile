import 'package:flutter/material.dart';

import 'i_colors.dart';

class IScrollbarTheme {
  static ScrollbarThemeData scrollbarThemeData() {
    return ScrollbarThemeData(
      interactive: true,
      thumbVisibility: MaterialStateProperty.all(true),
      trackVisibility: MaterialStateProperty.all(true),
      radius: const Radius.circular(10.0),
      thumbColor: MaterialStateProperty.all(Palette.primary),
      trackColor: MaterialStateProperty.all(Palette.primary.withOpacity(0.2)),
      thickness: MaterialStateProperty.all(10.0),
      minThumbLength: 100,
    );
  }

  static ScrollbarThemeData scrollbarThemeDataDark() {
    return ScrollbarThemeData(
      interactive: true,
      thumbVisibility: MaterialStateProperty.all(true),
      trackVisibility: MaterialStateProperty.all(true),
      radius: const Radius.circular(10.0),
      thumbColor: MaterialStateProperty.all(Palette.secondary),
      trackColor: MaterialStateProperty.all(Palette.secondary.withOpacity(0.2)),
      thickness: MaterialStateProperty.all(10.0),
      minThumbLength: 100,
    );
  }
}
