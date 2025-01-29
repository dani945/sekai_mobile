import 'package:flutter/material.dart';
import 'package:tes_sekai/util/context_extensions.dart';

import '../../../theme/i_colors.dart';

class IOutlineButton extends StatelessWidget {
  final Widget Function(BuildContext context) buildButton;

  const IOutlineButton._({Key? key, required this.buildButton}) : super(key: key);

  factory IOutlineButton.primary({
    required VoidCallback? onPressed,
    required String? title,
    Color? backgroundColor,
  }) {
    return IOutlineButton._(
      buildButton: (context) => OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.transparent,
          foregroundColor: context.primaryColor,
          minimumSize: const Size(0, 56),
        ).copyWith(side: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return BorderSide(color: context.disableColor);
            }
            return BorderSide(color: context.primaryColor);
          },
        )),
        child: Center(
            child: Text(
          title ?? "",
          textAlign: TextAlign.center,
        )),
      ),
    );
  }

  factory IOutlineButton.secondary({
    required VoidCallback? onPressed,
    required String? title,
  }) {
    return IOutlineButton._(
      buildButton: (context) => OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: Palette.secondary,
          minimumSize: const Size(0, 56),
        ).copyWith(side: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return BorderSide(color: context.disableColor);
            }
            return const BorderSide(color: Palette.secondary);
          },
        )),
        child: Center(
            child: Text(
          title ?? "",
          textAlign: TextAlign.center,
        )),
      ),
    );
  }

  factory IOutlineButton.theme({required VoidCallback? onPressed, Widget? child, String? title}) {
    assert(title == null || child == null, "please take out title or child");
    return IOutlineButton._(
      buildButton: (context) => OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: context.primaryColor,
          minimumSize: const Size(0, 56),
        ).copyWith(side: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return BorderSide(color: context.disableColor);
            }
            return BorderSide(color: context.primaryColor);
          },
        )),
        child: child ??
            Center(
                child: Text(
              title ?? "",
              textAlign: TextAlign.center,
            )),
      ),
    );
  }

  factory IOutlineButton.custom({required VoidCallback? onPressed, Widget? child, String? title, Color? color, Size? size, BorderRadiusGeometry? borderRadius, EdgeInsetsGeometry? padding}) {
    assert(title == null || child == null, "please take out title or child");
    return IOutlineButton._(
      buildButton: (context) => OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: padding,
          foregroundColor: color ?? context.primaryColor,
          fixedSize: size,
          maximumSize: size,
          minimumSize: size ?? const Size(0, 56),
          shape: RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.circular(24)),
        ).copyWith(side: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return BorderSide(color: context.disableColor);
            }
            return BorderSide(color: color ?? context.primaryColor);
          },
        )),
        child: child ??
            Center(
                child: Text(
              title ?? "",
              textAlign: TextAlign.center,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildButton(context);
  }
}
