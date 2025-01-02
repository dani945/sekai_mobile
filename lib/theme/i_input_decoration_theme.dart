import 'package:flutter/material.dart';

import 'i_colors.dart';

class IInputDecorationTheme{
  static InputDecorationTheme primary(){
    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide:  const BorderSide(color: Palette.neutral50, width: 1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      suffixIconColor: Palette.neutral80,
      prefixIconColor: Palette.neutral80,
      iconColor: Palette.neutral80,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
    );
  }
}