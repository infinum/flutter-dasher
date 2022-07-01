import 'package:flutter/material.dart';

@immutable
class ColorLookData {
  const ColorLookData({
    required this.brightness,
    required this.primary,
    required this.primaryContainer,
    required this.primaryPressed,
    required this.primaryDisabled,
    required this.secondary,
    required this.secondaryContainer,
    required this.secondaryPressed,
    required this.secondaryDisabled,
    required this.tertiary,
    required this.tertiaryDisabled,
    required this.onPrimary,
    required this.onSecondary,
    required this.error,
    required this.neutral,
    required this.onError,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.white10p,
    required this.black10p,
    required this.overlay,
    required this.green,
    required this.gray,
    required this.symbolGray,
    required this.border,
  });

  const ColorLookData.getDefaultWithUserSpecificColor([Color? primaryContainer]) // primaryContainer is assigned as user specific color
      : brightness = Brightness.light,
        primary = const Color(0xff1DA1F2),
        primaryContainer = primaryContainer ?? const Color(0xff005670),
        primaryPressed = const Color(0xff043E50),
        primaryDisabled = const Color(0xffc4d6dc),
        secondary = const Color(0xff4C9EEB),
        secondaryContainer = const Color(0xffAA198D),
        secondaryPressed = const Color(0xff7c0E66),
        secondaryDisabled = const Color(0xffe3cbde),
        tertiary = const Color(0xffe5eef1),
        tertiaryDisabled = const Color(0xffebebeb),
        neutral = const Color(0xff333333),
        background = Colors.white,
        surface = Colors.white,
        error = const Color(0xffFB3449),
        onError = Colors.white,
        onBackground = const Color(0xff141619),
        onSurface = const Color(0xff666666),
        onPrimary = Colors.white,
        onSecondary = Colors.white,
        black10p = const Color(0x1A000000),
        white10p = const Color(0x1AFFFFFF),
        overlay = const Color(0x8000374F),
        green = const Color(0xff00A03B),
        gray = const Color(0xffE7ECF0),
        symbolGray = const Color(0xff687684),
        border = const Color(0xffCED5DC);

  // Material color scheme
  final Brightness brightness;
  final Color primary;
  final Color primaryContainer;
  final Color secondary;
  final Color secondaryContainer;
  final Color onPrimary;
  final Color onSecondary;
  final Color error;
  final Color onError;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;

  // Other colors
  final Color white10p;
  final Color black10p;
  final Color overlay;
  final Color green;
  final Color gray;

  final Color neutral;

  // Other: Button colors
  final Color primaryPressed;
  final Color primaryDisabled;
  final Color secondaryPressed;
  final Color secondaryDisabled;
  final Color tertiary;
  final Color tertiaryDisabled;
  final Color symbolGray;
  final Color border;
}
