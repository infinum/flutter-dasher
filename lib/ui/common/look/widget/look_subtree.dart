import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../look_data/look_data.dart';
import '../look_data/specific_look_data/color_look_data.dart';
import '../look_data/specific_look_data/motion_look_data.dart';
import '../look_data/specific_look_data/shape_look_data.dart';
import '../look_data/specific_look_data/typography_look_data.dart';
import 'look.dart';
import 'user_specific_color_provider.dart';

/// This is widget that uses [Look] but it expands it with [UserSpecificColorProvider] so it can be refreshed at runtime.
///
/// If you don't have an use case where you need a runtime theme change, then you don't need to use this or
/// [UserSpecificColorProvider]
class LookSubtree extends ConsumerWidget {
  const LookSubtree({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Color color = ref.watch(userSpecificColorProvider);

    return Look(
      lookData: _createLookData(color),
      child: child,
    );
  }

  LookData _createLookData(Color userSpecificColor) {
    return LookData(
      color: ColorLookData.getDefaultWithUserSpecificColor(userSpecificColor),
      motion: const MotionLookData.getDefault(),
      shape: ShapeLookData.getDefault(),
      typography: const TypographyLookData.getDefault(),
    );
  }
}
