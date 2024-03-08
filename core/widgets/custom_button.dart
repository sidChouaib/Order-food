import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
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

  Widget get iconButtonWidget => ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: Size(width ?? 100, height ?? 62),
          //  primary: bkColor,
        ),
        onPressed: onTap,
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          child: child,
        ),
      );
}

/*  Container(
          height: height ?? 45,
          width: width ?? 45,
          padding: padding ?? EdgeInsets.zero,
          decoration: decoration ??
              BoxDecoration(
                color: bkColor ?? const Color.fromARGB(255, 5, 4, 4),
                borderRadius: BorderRadius.circular(10),
              ),
          child: child,
        ), */
