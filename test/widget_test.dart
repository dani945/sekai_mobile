// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    String input = "putra3";

    // Konversi input string menjadi bytes
    List<int> bytes = utf8.encode(input);

    // Hash dengan SHA-1
    Digest sha1Hash = sha1.convert(bytes);

    // Hasilkan hash dalam format hex
    print("Input: $input");
    print("SHA-1 Hash: $sha1Hash");
  });
}
