import 'package:flutter/material.dart';

import 'theme_helper.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillblueGray => BoxDecoration(
        color: appTheme.blueGray50,
      );

  /*  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      ); */

  // Outline decorations

  static BoxDecoration get outlineGray => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.gray50026,
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(
              1,
              1,
            ),
          ),
        ],
      );
  static BoxDecoration get shadow => BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: appTheme.gray50026,
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(
              1,
              1,
            ),
          ),
        ],
      );

  static BoxDecoration get fillLightBlue => BoxDecoration(
        color: appTheme.lightBlue400.withOpacity(0.46),
      );
  static BoxDecoration get fillLightblue400 => BoxDecoration(
        color: appTheme.lightBlue400,
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder22 => BorderRadius.circular(22);
  static BorderRadius get circleBorder24 => BorderRadius.circular(24);

  // Rounded borders
  static BorderRadius get roundedBorder15 => BorderRadius.circular(15);
  static BorderRadius get roundedBorder25 => BorderRadius.circular(25);
  static BorderRadius get roundedBorder32 => BorderRadius.circular(32);

  static BorderRadius get roundedBottomBorder32 => const BorderRadius.only(
      bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32));

  static BorderRadius get roundedTopBorder32 => const BorderRadius.only(
      topLeft: Radius.circular(32), topRight: Radius.circular(32));

  static BorderRadius get customBorderTL24 => const BorderRadius.vertical(
        top: Radius.circular(24),
      );
}

const double defaultPadding = 24;
