import 'package:flutter/material.dart';

import '../../look_data/look_data.dart';

/// We use Look to define style in our app, and ThemeData is used by Flutter framework.
/// Here we try to map as many ThemeData fields from Look.
class ThemeDataMapper {
  ThemeDataMapper._();

  static ThemeData map(LookData lookData) {
    final defaultTheme = ThemeData.light();

    return ThemeData(
      fontFamily: lookData.typography.primaryFontFamily,
      colorScheme: ColorScheme(
          primary: lookData.color.primary,
          primaryContainer: lookData.color.primaryContainer,
          secondary: lookData.color.secondary,
          onSecondary: lookData.color.onSecondary,
          secondaryContainer: lookData.color.secondaryContainer,
          surface: lookData.color.surface,
          background: lookData.color.background,
          error: lookData.color.error,
          onPrimary: lookData.color.onPrimary,
          onSurface: lookData.color.onSurface,
          onBackground: lookData.color.onBackground,
          onError: lookData.color.onError,
          brightness: lookData.color.brightness),
      primaryColor: lookData.color.primary,
      splashColor: lookData.color.secondary,
      errorColor: lookData.color.error,
      // disabledColor: lookData.color // waiting for designer to add color name
      backgroundColor: lookData.color.background,
      textTheme: defaultTheme.textTheme.copyWith(
          headline1: lookData.typography.h1,
          headline2: lookData.typography.h2,
          headline3: lookData.typography.h3,
          headline4: lookData.typography.h4,
          bodyText1: lookData.typography.body,
          bodyText2: lookData.typography.body2,
          caption: lookData.typography.caption,
          button: lookData.typography.button,
          subtitle1: lookData.typography.subtitle1,
          subtitle2: lookData.typography.subtitle2,
          overline: lookData.typography.overline),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: lookData.typography.body.copyWith(color: lookData.color.neutral),
        labelStyle: lookData.typography.body.copyWith(color: lookData.color.neutral),
        errorStyle: lookData.typography.caption.copyWith(color: lookData.color.error),
        focusColor: lookData.color.primary,
      ),
      brightness: lookData.color.brightness,
      cardColor: lookData.color.surface,
      scaffoldBackgroundColor: lookData.color.background,
      // cupertinoOverrideTheme: CupertinoThemeData(primaryColor: lookData.color.primary), // do we need this
    );
  }
}
