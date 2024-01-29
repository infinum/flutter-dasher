// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginNotifierHash() => r'6b88b66f62cb20aa1e2acca4e8de648a59a3b816';

/// See also [LoginNotifier].
@ProviderFor(LoginNotifier)
final loginNotifierProvider =
    AutoDisposeNotifierProvider<LoginNotifier, void>.internal(
  LoginNotifier.new,
  name: r'loginNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loginNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LoginNotifier = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

// **************************************************************************
// RiverpodMutationsGenerator
// **************************************************************************

extension LoginNotifierMutationExtension
    on AutoDisposeNotifierProvider<LoginNotifier, void> {
  Refreshable<LoginMutation> get login => _loginProvider;
}

final _loginProvider = Provider.autoDispose((ref) {
  final notifier = ref.watch(loginNotifierProvider.notifier);
  return LoginMutation(
    (newState) => ref.state = newState,
    notifier.login,
  );
}, dependencies: [loginNotifierProvider]);

typedef LoginSignature = Future<void> Function();
typedef LoginStateSetter = void Function(LoginMutation newState);

sealed class LoginMutation with AsyncMutation {
  factory LoginMutation(
    LoginStateSetter updateState,
    LoginSignature fn,
  ) = LoginMutationIdle._;

  LoginMutation._(this._updateState, this._fn);

  final LoginStateSetter _updateState;
  final LoginSignature _fn;

  Object? get error;
  StackTrace? get stackTrace;

  Future<void> call() async {
    try {
      _updateState(LoginMutationLoading.from(this));
      await _fn();
      _updateState(LoginMutationSuccess.from(this));
    } catch (e, s) {
      _updateState(LoginMutationFailure.from(this, error: e, stackTrace: s));
    }
  }
}

final class LoginMutationIdle extends LoginMutation with MutationIdle {
  LoginMutationIdle._(
    super._updateState,
    super._fn, {
    this.error,
    this.stackTrace,
  }) : super._();

  factory LoginMutationIdle.from(LoginMutation other) => LoginMutationIdle._(
        other._updateState,
        other._fn,
        error: other.error,
        stackTrace: other.stackTrace,
      );

  @override
  final Object? error;

  @override
  final StackTrace? stackTrace;
}

final class LoginMutationLoading extends LoginMutation with MutationLoading {
  LoginMutationLoading._(
    super._updateState,
    super._fn, {
    this.error,
    this.stackTrace,
  }) : super._();

  factory LoginMutationLoading.from(LoginMutation other) =>
      LoginMutationLoading._(
        other._updateState,
        other._fn,
        error: other.error,
        stackTrace: other.stackTrace,
      );

  @override
  final Object? error;

  @override
  final StackTrace? stackTrace;
}

final class LoginMutationSuccess extends LoginMutation with MutationSuccess {
  LoginMutationSuccess._(
    super._updateState,
    super._fn, {
    this.error,
    this.stackTrace,
  }) : super._();

  factory LoginMutationSuccess.from(LoginMutation other) =>
      LoginMutationSuccess._(
        other._updateState,
        other._fn,
        error: other.error,
        stackTrace: other.stackTrace,
      );

  @override
  final Object? error;

  @override
  final StackTrace? stackTrace;
}

final class LoginMutationFailure extends LoginMutation with MutationFailure {
  LoginMutationFailure._(
    super._updateState,
    super._fn, {
    required this.error,
    required this.stackTrace,
  }) : super._();

  factory LoginMutationFailure.from(
    LoginMutation other, {
    required Object error,
    required StackTrace stackTrace,
  }) =>
      LoginMutationFailure._(
        other._updateState,
        other._fn,
        error: error,
        stackTrace: stackTrace,
      );

  @override
  final Object error;

  @override
  final StackTrace stackTrace;
}
