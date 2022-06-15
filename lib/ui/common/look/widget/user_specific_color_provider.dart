import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'look_subtree.dart';

/// This is example of provider that can change theme and colors at runtime. If you don't have this case then you
/// don't need to use this provider or [LookSubtree].
///
/// We use provider to set new primaryContainer color and refresh theme at runtime.
class UserSpecificColorProvider extends StateNotifier<Color> {
  UserSpecificColorProvider() : super(Colors.grey.shade500);

  void setNewColor(Color newColor) {
    state = newColor;
  }
}

final userSpecificColorProvider = StateNotifierProvider<UserSpecificColorProvider, Color>((ref) {
  return UserSpecificColorProvider();
});
