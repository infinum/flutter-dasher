import 'package:flutter/material.dart';

@immutable
class TypographyLookData {
  const TypographyLookData({
    required this.primaryFontFamily,
    required this.h1,
    required this.h2,
    required this.h3,
    required this.h4,
    required this.subtitle1,
    required this.subtitle2,
    required this.body,
    required this.body2,
    required this.button,
    required this.caption,
    required this.overline,
    required this.label,
    required this.tweetBody,
    required this.tweetBold,
    required this.symbolLabel,
    required this.headerLabel,
    required this.lightButton,
  });

  const TypographyLookData.getDefault()
      : primaryFontFamily = 'Roboto',
        h1 = const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 45,
          letterSpacing: -0.3,
        ),
        h2 = const TextStyle(
          fontSize: 32,
          letterSpacing: -0.75,
        ),
        h3 = const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 22,
          letterSpacing: -0.3,
        ),
        h4 = const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        subtitle1 = const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          letterSpacing: -0.3,
        ),
        subtitle2 = const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        body = const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w400,
        ),
        body2 = const TextStyle(
          fontSize: 15,
        ),
        button = const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Colors.white,
          letterSpacing: -0.1,
        ),
        caption = const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 19,
          letterSpacing: -0.5,
        ),
        overline = const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        label = const TextStyle(
          fontSize: 16,
          letterSpacing: -0.3,
          fontWeight: FontWeight.w400,
        ),
        tweetBody = const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.3,
        ),
        tweetBold = const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.3,
        ),
        symbolLabel = const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.3,
        ),
        headerLabel = const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.9,
        ),
        lightButton = const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.3,
        );

  final String primaryFontFamily;

  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle h4;

  final TextStyle subtitle1;
  final TextStyle subtitle2;

  final TextStyle body;
  final TextStyle body2;
  final TextStyle button;

  final TextStyle caption;
  final TextStyle overline;

  final TextStyle label;

  final TextStyle tweetBody;
  final TextStyle tweetBold;
  final TextStyle symbolLabel;
  final TextStyle headerLabel;
  final TextStyle lightButton;
}
