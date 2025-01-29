import 'package:flutter/material.dart';
import 'package:tes_sekai/util/context_extensions.dart';

import '../../../theme/i_colors.dart';
import 'i_text.dart';

class IButton extends StatelessWidget {
  final Widget Function(BuildContext context) buildButton;

  const IButton._({Key? key, required this.buildButton}) : super(key: key);

  factory IButton.primary({
    required VoidCallback? onPressed,
    required String? title,
    TextAlign? textAlign,
  }) {
    return IButton._(
      buildButton: (context) => ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(0, 56),
          backgroundColor: Palette.primary,
          textStyle: context.labelMedium?.copyWith(color: Palette.white),
        ),
        child: Center(
          child: onPressed == null
              ? IText.scaleDown(
                  title ?? "",
                  textAlign: textAlign ?? TextAlign.center,
                )
              : IText.scaleDown(
                  title ?? "",
                  textAlign: textAlign ?? TextAlign.center,
                ),
        ),
      ),
    );
  }

  factory IButton.secondary({
    required VoidCallback? onPressed,
    required String? title,
    TextAlign? textAlign,
  }) {
    return IButton._(
      buildButton: (context) => ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Palette.secondary,
          minimumSize: const Size(0, 56),
        ),
        child: onPressed == null
            ? IText.scaleDown(
                title ?? "",
                style: context.labelMedium?.copyWith(color: Palette.white),
                textAlign: textAlign ?? TextAlign.center,
              )
            : IText.scaleDown(
                title ?? "",
                textAlign: textAlign ?? TextAlign.center,
              ),
      ),
    );
  }

  factory IButton.custom({
    required VoidCallback? onPressed,
    Widget? child,
    String? title,
    Color? color,
    EdgeInsetsGeometry? padding,
    TextAlign? textAlign,
  }) {
    assert(title == null || child == null, "please take out title or child");
    return IButton._(
      buildButton: (context) => ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: padding,
          backgroundColor: color,
          minimumSize: const Size(0, 56),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: child ??
            (onPressed == null
                ? IText.scaleDown(
                    title ?? "",
                    style: context.labelMedium?.copyWith(color: Palette.white),
                    textAlign: textAlign ?? TextAlign.center,
                  )
                : IText.scaleDown(
                    title ?? "",
                    textAlign: textAlign ?? TextAlign.center,
                  )),
      ),
    );
  }

  factory IButton.theme({
    required VoidCallback? onPressed,
    Widget? child,
    String? title,
    TextAlign? textAlign,
  }) {
    assert(title == null || child == null, "please take out title or child");
    return IButton._(
      buildButton: (context) => ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: context.primaryColor,
          minimumSize: const Size(0, 56),
        ),
        child: child ??
            (onPressed == null
                ? IText.scaleDown(
                    title ?? "",
                    style: context.labelMedium?.copyWith(color: Palette.white),
                    textAlign: textAlign ?? TextAlign.center,
                  )
                : IText.scaleDown(
                    title ?? "",
                    textAlign: textAlign ?? TextAlign.center,
                  )),
      ),
    );
  }

  factory IButton.rounded({
    required VoidCallback? onPressed,
    required String? title,
    TextAlign? textAlign,
  }) {
    return IButton._(
      buildButton: (context) => ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          minimumSize: const Size(0, 56),
        ),
        child: onPressed == null
            ? IText.scaleDown(
                title ?? "",
                style: context.labelMedium?.copyWith(color: Palette.white),
                textAlign: textAlign ?? TextAlign.center,
              )
            : IText.scaleDown(
                title ?? "",
                textAlign: textAlign ?? TextAlign.center,
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildButton(context);
  }
}
