import 'package:flutter/material.dart';

@immutable
class ShapeLookData {
  const ShapeLookData({
    required this.cardBorderRadius,
  });

  ShapeLookData.getDefault() : cardBorderRadius = BorderRadius.circular(24);

  // final ShapeBorder buttonShape;
  // final ShapeBorder circleButtonShape;
  final BorderRadius cardBorderRadius;
}
