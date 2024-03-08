import 'package:flutter/material.dart';

import '../theme/theme_helper.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {Key? key,
      this.alignment,
      this.height,
      this.width,
      this.padding,
      this.decoration,
      this.child,
      this.onTap,
      this.bkColor})
      : super(
          key: key,
        );

  final Alignment? alignment;

  final double? height;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final BoxDecoration? decoration;

  final Widget? child;

  final VoidCallback? onTap;

  final Color? bkColor;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
        height: height ?? 45,
        width: width ?? 45,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            height: height ?? 45,
            width: width ?? 45,
            padding: padding ?? EdgeInsets.zero,
            decoration: decoration ??
                BoxDecoration(
                  color: bkColor ?? appTheme.lightBlue400,
                  borderRadius: BorderRadius.circular(22),
                  
                ),
            child: child,
          ),
          onPressed: onTap,
        ),
      );
}

/// Extension on [CustomIconButton] to facilitate inclusion of all types of border style etc
extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get flightBlue => BoxDecoration(
        color: appTheme.lightBlue400,
        borderRadius: BorderRadius.circular(22),
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.circular(22),
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.blueGray50,
        borderRadius: BorderRadius.circular(22),
      );
}
