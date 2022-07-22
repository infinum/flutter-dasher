import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../ui/common/generic/generic_error.dart';
{{#brick_look}}import '../ui/common/look/mapping/theme_data_mapping/theme_data_mapper.dart';
import '../ui/common/look/widget/look.dart';
import '../ui/common/look/widget/look_subtree.dart';{{/brick_look}}

class {{project_name.pascalCase()}}App extends HookConsumerWidget {
{{project_name.pascalCase()}}App(this.screen, {Key? key}) : super(key: key);

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  final Widget screen;
{{#brick_look}}@override
  Widget build(BuildContext context, WidgetRef ref) {
    return LookSubtree(
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          color: Look.of(context).color.background,
          useInheritedMediaQuery: true,
          navigatorKey: _navigatorKey,
          theme: ThemeDataMapper.map(Look.of(context)),
          // locale: _languageProvider.locale ?? locale,
          builder: _builder,
          home: screen,
        );
      }),
    );
  }{{/brick_look}}{{^brick_look}}
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      useInheritedMediaQuery: true,
      navigatorKey: _navigatorKey,
      // locale: _languageProvider.locale ?? locale,
      builder: _builder,
      home: screen,
    );
  }{{/brick_look}}

  Widget _builder(BuildContext context, Widget? child) {
    _createErrorWidget(context);
    return  child ?? const SizedBox.shrink();
  }

  void _createErrorWidget(BuildContext context) {
    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      return Card(margin: const EdgeInsets.all(16), child: GenericError('Unexpected error'));
    };
  }
}
