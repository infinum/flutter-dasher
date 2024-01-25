import 'package:flutter/material.dart';
import 'package:flutter_dasher/ui/routing/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../ui/common/generic/generic_error.dart';
import '../ui/common/look/mapping/theme_data_mapping/theme_data_mapper.dart';
import '../ui/common/look/widget/look.dart';
import '../ui/common/look/widget/look_subtree.dart';

class DasherApp extends HookConsumerWidget {
  const DasherApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LookSubtree(
      child: Builder(builder: (context) {
        return MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          color: Colors.white,
          theme: ThemeDataMapper.map(Look.of(context)),
          builder: _builder,
        );
      }),
    );
  }

  Widget _builder(BuildContext context, Widget? child) {
    _createErrorWidget(context);
    return child ?? const SizedBox.shrink();
  }

  void _createErrorWidget(BuildContext context) {
    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      return const Card(margin: EdgeInsets.all(16), child: GenericError('Unexpected error'));
    };
  }
}
