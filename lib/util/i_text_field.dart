import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tes_sekai/util/context_extensions.dart';

import '../../../theme/i_colors.dart';
import 'i_input_decoration.dart';
import 'i_show_date_picker.dart';
import 'i_text_input_formater.dart';

class ITextField extends StatelessWidget {
  final String label;
  final String note;
  final String? erorText;
  final TextStyle? labelStyle;
  final bool fieldRequired;
  final Widget Function(BuildContext context) textFieldBuilder;

  const ITextField({
    Key? key,
    required this.label,
    this.note = "",
    this.erorText,
    this.labelStyle,
    this.fieldRequired = false,
    required this.textFieldBuilder,
  }) : super(key: key);

  factory ITextField._template(
      {Key? key,
      required String label,
      String note = "",
      String? erorText,
      VoidCallback? onTap,
      TextInputType? keyboardType,
      bool autofocus = false,
      bool readOnly = false,
      String? Function(String?)? validator,
      TextInputAction? textInputAction,
      required TextEditingController? controller,
      int? maxLine = 1,
      int? maxLength,
      TextCapitalization textCapitalization = TextCapitalization.words,
      InputDecorationType inputDecorationType = InputDecorationType.outline,
      Function(String value)? onChanged,
      Function(String value)? onFieldSubmitted,
      TextStyle? labelStyle,
      List<TextInputFormatter>? inputFormatters,
      TextAlign textAlign = TextAlign.start,
      InputDecoration? decoration,
      TextStyle? style,
      bool fieldRequired = false,
      bool obscureText = false}) {
    return ITextField(
      key: key,
      label: label,
      note: note,
      erorText: erorText,
      labelStyle: labelStyle,
      fieldRequired: fieldRequired,
      textFieldBuilder: (BuildContext context) {
        return TextFormField(
          textAlign: textAlign,
          // textAlignVertical: TextAlignVertical.center,
          readOnly: readOnly,
          cursorHeight: 23,
          autofocus: autofocus,
          decoration: decoration,
          inputFormatters: inputFormatters ??
              [
                FilteringTextInputFormatter.deny(
                  RegExp(
                    r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|'
                    r'\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])',
                  ),
                )
              ],
          style: style ?? context.subtitle1,
          key: key,
          validator: validator,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          controller: controller,
          textCapitalization: textCapitalization,
          onTap: onTap,
          obscureText: obscureText,
          onChanged: (value) {
            if (value.endsWith("  ")) {
              var data = value.substring(0, value.length - 1);
              controller?.text = data;
              controller?.selection = TextSelection.collapsed(offset: data.length);
            }
            if (onChanged != null) {
              onChanged(value);
            }
          },
          maxLines: maxLine,
          maxLength: maxLength,
          autocorrect: true,
          onFieldSubmitted: onFieldSubmitted,
        );
      },
    );
  }

  factory ITextField.primary({
    Key? key,
    required String label,
    String note = "",
    String? erorText,
    VoidCallback? onTap,
    TextInputType? keyboardType,
    bool autofocus = false,
    bool readOnly = false,
    String? Function(String?)? validator,
    bool fieldRequired = false,
    TextInputAction? textInputAction,
    Widget? suffixIcon,
    Widget? prefixIcon,
    String? hintText,
    required TextEditingController? controller,
    int? maxLine = 1,
    int? maxLength,
    TextCapitalization textCapitalization = TextCapitalization.words,
    InputDecorationType inputDecorationType = InputDecorationType.outline,
    Function(String value)? onChanged,
    Function(String value)? onFieldSubmitted,
    TextStyle? labelStyle,
    List<TextInputFormatter>? inputFormatters,
    String? errorText,
    TextStyle? style,
    Color colorBgTextField = Palette.neutral10,
    Color borderColor = Palette.neutral50,
  }) {
    return ITextField._template(
      inputFormatters: inputFormatters,
      key: key,
      label: label,
      note: note,
      erorText: erorText,
      onTap: onTap,
      obscureText: false,
      maxLine: maxLine,
      keyboardType: keyboardType,
      autofocus: autofocus,
      readOnly: readOnly,
      textCapitalization: textCapitalization,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      inputDecorationType: inputDecorationType,
      decoration: IInputDecoration.primary(
        hintText: hintText,
        suffixIcon: suffixIcon,
        inputDecorationType: inputDecorationType,
        borderColor: borderColor,
        fillColor: onTap != null
            ? colorBgTextField
            : readOnly
                ? Palette.readonly
                : colorBgTextField,
        prefixIcon: prefixIcon,
        errorText: errorText,
      ),
      fieldRequired: fieldRequired,
      validator: validator,
      textInputAction: textInputAction,
      controller: controller,
      labelStyle: labelStyle,
      maxLength: maxLength,
      style: style,
    );
  }

  factory ITextField.email({
    Key? key,
    required String label,
    String note = "",
    String? erorText,
    VoidCallback? onTap,
    TextInputType? keyboardType,
    bool autofocus = false,
    bool readOnly = false,
    String? Function(String?)? validator,
    bool fieldRequired = false,
    TextInputAction? textInputAction,
    Widget? suffixIcon,
    Widget? prefixIcon,
    String? hintText,
    required TextEditingController? controller,
    int? maxLine = 1,
    int? maxLength,
    TextCapitalization textCapitalization = TextCapitalization.words,
    InputDecorationType inputDecorationType = InputDecorationType.outline,
    Function(String value)? onChanged,
    Function(String value)? onFieldSubmitted,
    TextStyle? labelStyle,
    List<TextInputFormatter>? inputFormatters,
    String? errorText,
    Color borderColor = Palette.neutral50,
  }) {
    return ITextField._template(
      inputFormatters: inputFormatters,
      key: key,
      label: label,
      note: note,
      erorText: erorText,
      onTap: onTap,
      obscureText: false,
      maxLine: maxLine,
      keyboardType: TextInputType.emailAddress,
      autofocus: autofocus,
      readOnly: readOnly,
      textCapitalization: textCapitalization,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      inputDecorationType: inputDecorationType,
      decoration: IInputDecoration.primary(
        hintText: hintText,
        suffixIcon: suffixIcon,
        inputDecorationType: inputDecorationType,
        borderColor: borderColor,
        fillColor: onTap != null
            ? Palette.neutral10
            : readOnly
                ? Palette.readonly
                : Palette.neutral10,
        prefixIcon: prefixIcon,
        errorText: errorText,
      ),
      fieldRequired: fieldRequired,
      validator: validator,
      textInputAction: textInputAction,
      controller: controller,
      labelStyle: labelStyle,
      maxLength: maxLength,
    );
  }

  factory ITextField.number({
    Key? key,
    required String label,
    String note = "",
    String? erorText,
    VoidCallback? onTap,
    bool autofocus = false,
    bool readOnly = false,
    String? Function(String?)? validator,
    bool fieldRequired = false,
    TextInputAction? textInputAction,
    Widget? suffixIcon,
    Widget? prefixIcon,
    String? hintText,
    required TextEditingController? controller,
    int? maxLine = 1,
    int? maxLength,
    TextCapitalization textCapitalization = TextCapitalization.words,
    InputDecorationType inputDecorationType = InputDecorationType.outline,
    Function(String value)? onChanged,
    Function(String value)? onFieldSubmitted,
    TextStyle? labelStyle,
    String? errorText,
    Color borderColor = Palette.neutral50,
  }) {
    return ITextField._template(
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      key: key,
      label: label,
      note: note,
      erorText: erorText,
      onTap: onTap,
      obscureText: false,
      maxLine: maxLine,
      keyboardType: TextInputType.number,
      autofocus: autofocus,
      readOnly: readOnly,
      textCapitalization: textCapitalization,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      inputDecorationType: inputDecorationType,
      decoration: IInputDecoration.primary(
        hintText: hintText,
        suffixIcon: suffixIcon,
        inputDecorationType: inputDecorationType,
        borderColor: borderColor,
        fillColor: onTap != null
            ? Palette.neutral10
            : readOnly
                ? Palette.readonly
                : Palette.neutral10,
        prefixIcon: prefixIcon,
        errorText: errorText,
      ),
      fieldRequired: fieldRequired,
      validator: validator,
      textInputAction: textInputAction,
      controller: controller,
      labelStyle: labelStyle,
      maxLength: maxLength,
    );
  }

  factory ITextField.password({
    Key? key,
    required String label,
    String note = "",
    String? erorText,
    VoidCallback? onTap,
    bool autofocus = false,
    bool readOnly = false,
    String? Function(String?)? validator,
    bool fieldRequired = false,
    TextInputAction? textInputAction,
    Widget? suffixIcon,
    Widget? prefixIcon,
    String? hintText,
    TextInputType? textInputType,
    required TextEditingController? controller,
    TextCapitalization textCapitalization = TextCapitalization.none,
    bool obscureText = true,
    Function(String value)? onChanged,
    int? maxLine = 1,
    int? maxLength,
    TextStyle? labelStyle,
    TextStyle? style,
    List<TextInputFormatter>? inputFormatters,
    InputDecorationType inputDecorationType = InputDecorationType.outline,
    String? errorText,
    Color borderColor = Palette.neutral50,
  }) {
    return ITextField._template(
      key: key,
      label: label,
      note: note,
      erorText: erorText,
      onTap: onTap,
      onChanged: onChanged,
      maxLine: maxLine,
      obscureText: obscureText,
      keyboardType: textInputType ?? TextInputType.visiblePassword,
      autofocus: autofocus,
      readOnly: readOnly,
      inputDecorationType: inputDecorationType,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      decoration: IInputDecoration.primary(
        hintText: hintText,
        suffixIcon: suffixIcon,
        borderColor: borderColor,
        fillColor: onTap != null
            ? Palette.neutral10
            : readOnly
                ? Palette.readonly
                : Palette.neutral10,
        prefixIcon: prefixIcon,
        errorText: errorText,
      ),
      fieldRequired: fieldRequired,
      validator: validator,
      textInputAction: textInputAction,
      controller: controller,
      labelStyle: labelStyle,
      maxLength: maxLength,
      style: style,
    );
  }

  factory ITextField.dateTime({
    Key? key,
    required String label,
    String note = "",
    String? erorText,
    bool autofocus = false,
    String? Function(String?)? validator,
    bool required = false,
    TextInputAction? textInputAction,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? errorText,
    required TextEditingController? controller,
    TextCapitalization textCapitalization = TextCapitalization.words,
    Function(String value)? onChanged,
    required Function(DateTime? dateTime) onSubmitted,
    required BuildContext context,
    TextStyle? labelStyle,
    InputDecorationType inputDecorationType = InputDecorationType.outline,
    String? hinText,
    BoxConstraints? suffixIconConstraints,
  }) {
    return ITextField._template(
      key: key,
      label: label,
      note: note,
      erorText: erorText,
      maxLine: null,
      obscureText: false,
      keyboardType: TextInputType.number,
      autofocus: autofocus,
      inputDecorationType: inputDecorationType,
      textCapitalization: textCapitalization,
      onChanged: onChanged,
      inputFormatters: [
        ITextInputFormatterDate(),
        FilteringTextInputFormatter.deny(RegExp('[^/0-9]')),
        // MaskTextInputFormatter(
        //     mask: "##-##-####",
        //     filter: { "#": RegExp('^[0-9]') },
        //     type: MaskAutoCompletionType.lazy
        // )
      ],
      decoration: IInputDecoration.primary(
        hintText: hinText,
        suffixIconConstraints: suffixIconConstraints,
        suffixIcon: suffixIcon ??
            InkWell(
              onTap: () {
                IShowDatePicker.dateOfBirth(context, initialEntryMode: DatePickerEntryMode.calendarOnly).then((value) {
                  onSubmitted(value);
                });
              },
              child: Container(
                width: context.mQWidth(0.05),
                height: context.mQWidth(0.05),
                margin: const EdgeInsets.only(top: 8, right: 8, bottom: 8),
                child: const Icon(Icons.date_range_outlined),
              ),
            ),
        fillColor: Palette.neutral10,
        prefixIcon: prefixIcon,
        errorText: errorText,
      ),
      fieldRequired: required,
      // style: IBody.regular(color: IColorTheme.neutral100),
      validator: validator,
      textInputAction: textInputAction,
      controller: controller,
      labelStyle: labelStyle,
      maxLength: 10,
      onTap: () {
        IShowDatePicker.dateOfBirth(context, initialEntryMode: DatePickerEntryMode.calendarOnly).then((value) {
          onSubmitted(value);
        });
      },
      readOnly: true,
    );
  }

  factory ITextField.search({
    Key? key,
    String label = "",
    String note = "",
    String? erorText,
    VoidCallback? onTap,
    bool autofocus = false,
    bool readOnly = false,
    String? Function(String?)? validator,
    bool fieldRequired = false,
    TextInputAction? textInputAction,
    Widget? suffixIcon,
    Widget? prefixIcon,
    String? hintText,
    TextInputType? textInputType,
    required TextEditingController? controller,
    TextCapitalization textCapitalization = TextCapitalization.none,
    bool obscureText = false,
    Function(String value)? onChanged,
    int? maxLine = 1,
    int? maxLength,
    TextStyle? labelStyle,
    List<TextInputFormatter>? inputFormatters,
    double borderRadiusSize = 8.0,
    Color colorBorder = Palette.neutral50,
    InputDecorationType inputDecorationType = InputDecorationType.outline,
    String? errorText,
    BoxConstraints? suffixIconConstraints,
    EdgeInsetsGeometry? contentPadding,
    TextStyle? hintStyle,
    Function(String value)? onFieldSubmitted,
  }) {
    return ITextField._template(
      key: key,
      label: label,
      note: note,
      erorText: erorText,
      onTap: onTap,
      onChanged: onChanged,
      maxLine: maxLine,
      obscureText: obscureText,
      keyboardType: textInputType ?? TextInputType.visiblePassword,
      autofocus: autofocus,
      readOnly: readOnly,
      inputDecorationType: inputDecorationType,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      onFieldSubmitted: onFieldSubmitted,
      decoration: IInputDecorationSearch.search(
        borderRadiusSize: borderRadiusSize,
        colorBorder: colorBorder,
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: onTap != null
            ? Palette.neutral10
            : readOnly
                ? Palette.readonly
                : Palette.neutral10,
        errorText: errorText,
        suffixIconConstraints: suffixIconConstraints,
        contentPadding: contentPadding,
        hintStyle: hintStyle,
      ),
      fieldRequired: fieldRequired,
      validator: validator,
      textInputAction: textInputAction,
      controller: controller,
      labelStyle: labelStyle,
      maxLength: maxLength,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label(context),
        context.sbHeight(size: 8),
        textFieldBuilder(context),
        Align(alignment: Alignment.centerRight, child: _errorText(context)),
        Align(alignment: Alignment.centerRight, child: _note(context)),
      ],
    );
  }

  Widget _label(BuildContext context) {
    return label.isEmpty
        ? const SizedBox()
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: labelStyle ?? context.subtitle1,
              ),
              fieldRequired
                  ? Text(
                      "*",
                      style: context.subtitle1,
                    )
                  : const SizedBox()
            ],
          );
  }

  Widget _note(BuildContext context) {
    return note.isEmpty
        ? const SizedBox()
        : Column(
            children: [
              context.sbHeight(size: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Text("Note: ", style: context.bodySmall),
                  Expanded(
                    child: Text(
                      note,
                      style: context.button?.copyWith(fontSize: 10, color: Palette.disable),
                      textAlign: TextAlign.right,
                    ),
                  )
                ],
              ),
            ],
          );
  }

  Widget _errorText(BuildContext context) {
    return erorText == null
        ? const SizedBox()
        : Column(
            children: [
              context.sbHeight(size: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Text("Note: ", style: context.bodySmall),
                  Expanded(
                    child: Text(
                      erorText!,
                      style: context.button?.copyWith(fontSize: 10, color: Palette.red),
                      textAlign: TextAlign.right,
                    ),
                  )
                ],
              ),
            ],
          );
  }
}
