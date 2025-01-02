
import 'package:flutter/services.dart';

class ITextInputFormatterDate extends TextInputFormatter {
  final String separator;

  ITextInputFormatterDate({this.separator = '/'});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final String text = newValue.text;
    final String textOld = oldValue.text;
    final int textLength = text.length;
    final StringBuffer buffer = StringBuffer();

    // ##-##-####
    if (textLength == 2 && textOld.length < textLength) {
      var day = int.parse(text);
      if (day >= 31) {
        buffer.write("31$separator");
      } else {
        buffer.write("$text$separator");
      }
    } else if (textLength == 3 && textOld.length == 2) {
      if (text.substring(3) != separator) {
        buffer
            .write("${text.substring(0, 2)}$separator${text.substring(2, 3)}");
      }
    } else if (textLength == 6 && textOld.length == 5) {
      if (text.substring(6) != separator) {
        buffer
            .write("${text.substring(0, 5)}$separator${text.substring(5, 6)}");
      }
    } else if (textLength == 5 && textOld.length < textLength) {
      var month = int.parse(text.substring(3, 5));
      var day = int.parse(textOld.substring(0, 2));
      if (month >= 12) {
        buffer.write("${textOld.substring(0, 3)}12");
      } else if (month % 2 == 0 && day == 31 && month != 02) {
        buffer.write("30$separator${text.substring(3, 5)}$separator");
      } else if (month == 02 && day >= 30) {
        buffer.write("29$separator${text.substring(3, 5)}$separator");
      } else {
        buffer.write("$text$separator");
      }
    } else {
      if (textLength <= 10) {
        if (textLength == 10) {
          var date = int.parse(textOld.substring(0, 2));
          var month = textOld.substring(3, 5);
          var year = int.parse(text.substring(6, 10));
          bool isNotLeapYear =
              !((year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0));
          if (isNotLeapYear && month == "02" && date >= 29) {
            buffer.write("28$separator$month$separator$year");
          } else {
            buffer.write(text);
          }
        } else {
          buffer.write(text);
        }
      } else {
        buffer.write(textOld);
      }
    }

    return newValue.copyWith(
      text: buffer.toString(),
      selection: TextSelection.fromPosition(
          TextPosition(offset: buffer.toString().length)),
    );
  }
}

class CreditCardNumberFormat extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    String enteredData = newValue.text; // get data enter by used in textField
    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < enteredData.length; i++) {
      // add each character into String buffer
      buffer.write(enteredData[i]);
      int index = i + 1;
      if (index % 4 == 0 && enteredData.length != index) {
        // add space after 4th digit
        buffer.write(" ");
      }
    }

    return TextEditingValue(
        text: buffer.toString(),
        selection: TextSelection.collapsed(
            offset: buffer.toString().length) // keep the cursor at end
        );
  }
}

class ITextInputFormatterMonthYear extends TextInputFormatter {
  static const _separator = '/';
  static const _separatorPositions = <int>[2];

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newValueText = _getCleanText(newValue);
    var newText = '';

    if (newValueText.isNotEmpty) {
      for (var i = 0; i < newValueText.length; i++) {
        final c = newValueText[i];
        if (i == _separatorPositions.first && c != _separator) {
          if (int.parse(newText) >= 12) {
            newText = '12$_separator';
          } else {
            newText += _separator;
          }
        }
        newText += c;
      }
    }

    final newSelection = TextSelection(
      baseOffset: newText.length,
      extentOffset: newText.length,
    );

    return TextEditingValue(
      text: newText,
      selection: newSelection,
      composing: TextRange.empty,
    );
  }

  String _getCleanText(TextEditingValue value) {
    return value.text.replaceAll(_separator, '');
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
