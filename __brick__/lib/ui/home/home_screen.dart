import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<dynamic>(
      builder: (BuildContext context) {
        return const HomeScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Hello world!'),
      ),
    );
  }
}
