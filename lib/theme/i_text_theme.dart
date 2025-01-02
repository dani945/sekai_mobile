import 'package:flutter/material.dart';

class ITextTheme {
  static TextStyle? fromString(String text) {
    var textTheme3 = textThemeMaterial3();
    var textTheme2 = textThemeMaterial2();
    switch (text) {
      case "Headline/Large":
        return textTheme3.headlineLarge;
      case "Headline/Medium":
        return textTheme3.headlineMedium;
      case "Headline/Small":
        return textTheme3.headlineSmall;
      case "Title/Large":
        return textTheme3.titleLarge;
      case "Title/Medium":
        return textTheme3.titleMedium;
      case "Title/Small":
        return textTheme3.titleSmall;
      case "Label/Large":
        return textTheme3.labelLarge;
      case "Label/Medium":
        return textTheme3.labelMedium;
      case "Label/Small":
        return textTheme3.labelSmall;
      case "Body/Large":
        return textTheme3.bodyLarge;
      case "Body/Medium":
        return textTheme3.bodyMedium;
      case "Body/Small":
        return textTheme3.bodySmall;
      case "Qris/Body 2":
        return textTheme2.bodyMedium;
      case "Qris/Body 5":
        return textTheme2.bodyLarge;
      case "Subtitle/1":
        return textTheme2.titleMedium;
      case "Subtitle/2":
        return textTheme2.titleSmall;
      case "Button":
        return textTheme2.labelLarge;
      case "Caption":
        return textTheme2.bodySmall;
      case "Overline":
        return textTheme2.labelSmall;
      case "Headline/1":
        return textTheme2.displayLarge;
      default:
        return null;
    }
  }

  static TextTheme textThemeMaterial3() {
    return const TextTheme(
      headlineLarge: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 30,
        // height: 2.6,
        color: Colors.black,
      ),
      headlineMedium: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: 24,
        // height: 3.2,
        letterSpacing: 0.5,
        color: Colors.black,
      ),
      headlineSmall: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
        // height: 1.6,
        letterSpacing: 0.5,
        color: Colors.black,
      ),
      titleLarge: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        // height: 1.6,
        letterSpacing: 0.5,
        color: Colors.black,
      ),
      titleMedium: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 16,
        // height: 1.6,
        letterSpacing: 0.5,
        color: Colors.black,
      ),
      titleSmall: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: 16,
        // height: 1.6,
        letterSpacing: 0.5,
        color: Colors.black,
      ),
      labelLarge: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        // height: 32,
        letterSpacing: 0.5,
        color: Colors.black,
      ),
      labelMedium: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: 14,
        // height: 16,
        letterSpacing: 0.5,
        color: Colors.black,
      ),
      labelSmall: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        // height: 16,
        letterSpacing: 0.5,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        // height: 16,
        letterSpacing: 0.5,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        // height: 16,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 12,
        // height: 16,
        color: Colors.black,
      ),
      // bodyText2: const TextStyle(
      //   fontStyle: FontStyle.normal,
      //   fontWeight: FontWeight.w500,
      //   fontSize: 16,
      //   // height: 16,
      //   color: Colors.black,
      // ),
      // bodyText1: const TextStyle(
      //   fontStyle: FontStyle.normal,
      //   fontWeight: FontWeight.w500,
      //   fontSize: 12,
      //   // height: 16,
      //   color: Colors.black,
      // ),
    );
  }

  static TextTheme textThemeMaterial2() {
    return const TextTheme(
      titleMedium: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: Colors.black,
      ),
      titleSmall: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        letterSpacing: 0.5,
        color: Colors.black,
      ),
      labelLarge: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 11,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: 10,
        letterSpacing: 0.5,
        color: Colors.black,
      ),
      labelSmall: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 10,
        letterSpacing: 0.4,
        color: Colors.black,
      ),
      displayLarge: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: Colors.black,
      ),
      displayMedium: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: Colors.black,
      ),
      displaySmall: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: Colors.black,
      ),
      headlineMedium: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 10,
        color: Colors.black,
      ),
      headlineSmall: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        // height: 16,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        // height: 16,
        color: Colors.black,
      ),
    );
  }
}
