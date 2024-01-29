import 'package:flutter_dasher/authentication/authentication_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_mutations_annotation/riverpod_mutations_annotation.dart';

part 'logout_notifier.g.dart';

@riverpod
class LogoutNotifier extends _$LogoutNotifier {
  @override
  void build() {}

  @mutation
  Future<void> logout() async {
    ref.read(authenticationManagerProvider.notifier).onUnauthenticated();
  }
}
