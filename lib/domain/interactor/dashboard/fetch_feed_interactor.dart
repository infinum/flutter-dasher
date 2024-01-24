import 'package:flutter_dasher/common/model/tweet.dart';
import 'package:flutter_dasher/domain/interactor/dashboard/fetch_feed_interactor_impl.dart';
import 'package:flutter_dasher/domain/repository/feed_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_feed_interactor.g.dart';

@riverpod
FetchFeedInteractor fetchFeedInteractor(FetchFeedInteractorRef ref) {
  return FetchFeedInteractorImpl(ref.read(feedRepositoryProvider));
}

abstract class FetchFeedInteractor {
  Future<List<Tweet>> fetchFeedTimeline();
}
