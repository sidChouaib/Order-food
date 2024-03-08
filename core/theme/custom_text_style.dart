import 'package:flutter/material.dart';

import 'theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeBluegray900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blueGray900,
      );
  static get bodyLargewhiteA => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.whiteA700,
      );

  static get bodyMediumBluegray900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray900,
        fontSize: 13,
      );
  static get bodyMediumBluegray600 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray600,
        fontSize: 13,
      );
  static get bodyMediumBluegray300 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray300,
        // Use in Select Size: FoodDetailScree
      );
  static get bodyMedium15Bluegray300 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray300,
        fontSize: 15,
      );

  static get bodyMediumGray700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray700,
        fontSize: 14,
      );

  // Title text style
  static get titleLargeGray90001 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray90001,
      );

  static get titleMediumWihte => theme.textTheme.titleMedium!.copyWith(
        color: const Color.fromARGB(255, 248, 248, 248),
      );

  static get titleMediumff1e1d1d => theme.textTheme.titleMedium!.copyWith(
        color: const Color(0XFF1E1D1D),
      );

  static get titleMediumGray90001 => theme.textTheme.titleMedium!
      .copyWith(color: appTheme.gray90001, fontWeight: FontWeight.bold);

  static get titleSma5llBluegray90001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray90001,
        fontSize: 14,
      );
  static get titleLargeWhite => theme.textTheme.titleMedium!.copyWith(
        color: Color.fromARGB(255, 248, 248, 248),
        fontSize: 20,
      );
  static get bodyLargeBluegray300 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray300,
        fontSize: 20,
      );
  static get bodyExtraLargeBluegray900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blueGray900,
        fontSize: 18,
      );

  static get appBarTitle => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray90001,
        fontSize: 17,
      );
  static get appBarSubTitle => theme.textTheme.bodyMedium!.copyWith(
        color: ColorSchemes.primaryColorScheme.onPrimary,
      );
}

extension on TextStyle {}
