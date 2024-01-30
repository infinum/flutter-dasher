// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_tweets_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userTweetsNotifierHash() =>
    r'b1fe94133f8f85b23b4eb26bbfab43a2b8510b83';

/// See also [UserTweetsNotifier].
@ProviderFor(UserTweetsNotifier)
final userTweetsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<UserTweetsNotifier, List<Tweet>>.internal(
  UserTweetsNotifier.new,
  name: r'userTweetsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userTweetsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserTweetsNotifier = AutoDisposeAsyncNotifier<List<Tweet>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

// **************************************************************************
// RiverpodMutationsGenerator
// **************************************************************************

extension UserTweetsNotifierMutationExtension
    on AutoDisposeAsyncNotifierProvider<UserTweetsNotifier, List<Tweet>> {
  Refreshable<PostNewTweetMutation> get postNewTweet => _postNewTweetProvider;
}

final _postNewTweetProvider = Provider.autoDispose((ref) {
  final notifier = ref.watch(userTweetsNotifierProvider.notifier);
  return PostNewTweetMutation(
    (newState) => ref.state = newState,
    notifier.postNewTweet,
  );
}, dependencies: [userTweetsNotifierProvider]);

typedef PostNewTweetSignature = Future<void> Function(String tweet);
typedef PostNewTweetStateSetter = void Function(PostNewTweetMutation newState);

sealed class PostNewTweetMutation with AsyncMutation {
  factory PostNewTweetMutation(
    PostNewTweetStateSetter updateState,
    PostNewTweetSignature fn,
  ) = PostNewTweetMutationIdle._;

  PostNewTweetMutation._(this._updateState, this._fn);

  final PostNewTweetStateSetter _updateState;
  final PostNewTweetSignature _fn;

  Object? get error;
  StackTrace? get stackTrace;

  Future<void> call(String tweet) async {
    try {
      _updateState(PostNewTweetMutationLoading.from(this));
      await _fn(tweet);
      _updateState(PostNewTweetMutationSuccess.from(this));
    } catch (e, s) {
      _updateState(
          PostNewTweetMutationFailure.from(this, error: e, stackTrace: s));
    }
  }
}

final class PostNewTweetMutationIdle extends PostNewTweetMutation
    with MutationIdle {
  PostNewTweetMutationIdle._(
    super._updateState,
    super._fn, {
    this.error,
    this.stackTrace,
  }) : super._();

  factory PostNewTweetMutationIdle.from(PostNewTweetMutation other) =>
      PostNewTweetMutationIdle._(
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

final class PostNewTweetMutationLoading extends PostNewTweetMutation
    with MutationLoading {
  PostNewTweetMutationLoading._(
    super._updateState,
    super._fn, {
    this.error,
    this.stackTrace,
  }) : super._();

  factory PostNewTweetMutationLoading.from(PostNewTweetMutation other) =>
      PostNewTweetMutationLoading._(
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

final class PostNewTweetMutationSuccess extends PostNewTweetMutation
    with MutationSuccess {
  PostNewTweetMutationSuccess._(
    super._updateState,
    super._fn, {
    this.error,
    this.stackTrace,
  }) : super._();

  factory PostNewTweetMutationSuccess.from(PostNewTweetMutation other) =>
      PostNewTweetMutationSuccess._(
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

final class PostNewTweetMutationFailure extends PostNewTweetMutation
    with MutationFailure {
  PostNewTweetMutationFailure._(
    super._updateState,
    super._fn, {
    required this.error,
    required this.stackTrace,
  }) : super._();

  factory PostNewTweetMutationFailure.from(
    PostNewTweetMutation other, {
    required Object error,
    required StackTrace stackTrace,
  }) =>
      PostNewTweetMutationFailure._(
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
