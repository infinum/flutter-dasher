import 'package:flutter/material.dart';

import '../look_data/look_data.dart';
import 'look.dart';

class LookBuilder extends StatelessWidget {
  const LookBuilder({
    Key? key,
    required this.lookData,
    required this.builder,
  }) : super(key: key);

  final LookData lookData;
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return Look(
      lookData: lookData,
      child: Builder(builder: builder),
    );
  }
}
