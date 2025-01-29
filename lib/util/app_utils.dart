import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

class AppUtils {
  const AppUtils._();

  static void showSnackbar(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static String getInitials(String fullName) {
    // Split the string into words
    List<String> words = fullName.trim().split(' ');

    // Check if there are at least two words
    if (words.length < 2) return '';

    // Take the first letter of the first two words
    String firstInitial = words[0].isNotEmpty ? words[0][0].toUpperCase() : '';
    String secondInitial = words[1].isNotEmpty ? words[1][0].toUpperCase() : '';

    // Combine and return the initials
    return '$firstInitial$secondInitial';
  }

  static String generateToSHA1({required String value}) {
    if (value.isNotEmpty) {
      List<int> bytes = utf8.encode(value);
      Digest sha1Hash = sha1.convert(bytes);
      return sha1Hash.toString();
    } else {
      return "";
    }
  }

  static String isValidEmail(String email) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!regex.hasMatch(email)) {
      return "Email tidak valid";
    } else {
      return "";
    }
  }
}
