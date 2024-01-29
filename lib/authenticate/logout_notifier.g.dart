// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$logoutNotifierHash() => r'dc336b192778f1749952c48e44ee873aa3ffead9';

/// See also [LogoutNotifier].
@ProviderFor(LogoutNotifier)
final logoutNotifierProvider =
    AutoDisposeNotifierProvider<LogoutNotifier, void>.internal(
  LogoutNotifier.new,
  name: r'logoutNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$logoutNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LogoutNotifier = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

// **************************************************************************
// RiverpodMutationsGenerator
// **************************************************************************

extension LogoutNotifierMutationExtension
    on AutoDisposeNotifierProvider<LogoutNotifier, void> {
  Refreshable<LogoutMutation> get logout => _logoutProvider;
}

final _logoutProvider = Provider.autoDispose((ref) {
  final notifier = ref.watch(logoutNotifierProvider.notifier);
  return LogoutMutation(
    (newState) => ref.state = newState,
    notifier.logout,
  );
}, dependencies: [logoutNotifierProvider]);

typedef LogoutSignature = Future<void> Function();
typedef LogoutStateSetter = void Function(LogoutMutation newState);

sealed class LogoutMutation with AsyncMutation {
  factory LogoutMutation(
    LogoutStateSetter updateState,
    LogoutSignature fn,
  ) = LogoutMutationIdle._;

  LogoutMutation._(this._updateState, this._fn);

  final LogoutStateSetter _updateState;
  final LogoutSignature _fn;

  Object? get error;
  StackTrace? get stackTrace;

  Future<void> call() async {
    try {
      _updateState(LogoutMutationLoading.from(this));
      await _fn();
      _updateState(LogoutMutationSuccess.from(this));
    } catch (e, s) {
      _updateState(LogoutMutationFailure.from(this, error: e, stackTrace: s));
    }
  }
}

final class LogoutMutationIdle extends LogoutMutation with MutationIdle {
  LogoutMutationIdle._(
    super._updateState,
    super._fn, {
    this.error,
    this.stackTrace,
  }) : super._();

  factory LogoutMutationIdle.from(LogoutMutation other) => LogoutMutationIdle._(
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

final class LogoutMutationLoading extends LogoutMutation with MutationLoading {
  LogoutMutationLoading._(
    super._updateState,
    super._fn, {
    this.error,
    this.stackTrace,
  }) : super._();

  factory LogoutMutationLoading.from(LogoutMutation other) =>
      LogoutMutationLoading._(
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

final class LogoutMutationSuccess extends LogoutMutation with MutationSuccess {
  LogoutMutationSuccess._(
    super._updateState,
    super._fn, {
    this.error,
    this.stackTrace,
  }) : super._();

  factory LogoutMutationSuccess.from(LogoutMutation other) =>
      LogoutMutationSuccess._(
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

final class LogoutMutationFailure extends LogoutMutation with MutationFailure {
  LogoutMutationFailure._(
    super._updateState,
    super._fn, {
    required this.error,
    required this.stackTrace,
  }) : super._();

  factory LogoutMutationFailure.from(
    LogoutMutation other, {
    required Object error,
    required StackTrace stackTrace,
  }) =>
      LogoutMutationFailure._(
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
