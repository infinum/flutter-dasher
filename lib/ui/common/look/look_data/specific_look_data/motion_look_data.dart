import 'package:flutter/material.dart';

@immutable
class MotionLookData {
  const MotionLookData({
    required this.durationVeryFast,
    required this.durationFast,
    required this.durationNormal,
    required this.durationSlow,
  });

  const MotionLookData.getDefault()
      : durationVeryFast = const Duration(milliseconds: 100),
        durationFast = const Duration(milliseconds: 200),
        durationNormal = const Duration(milliseconds: 300),
        durationSlow = const Duration(milliseconds: 500);

  final Duration durationVeryFast;
  final Duration durationFast;
  final Duration durationNormal;
  final Duration durationSlow;
}
