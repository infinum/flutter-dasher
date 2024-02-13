import 'package:flutter_dasher/common/model/tweet.dart';
import 'package:flutter_dasher/domain/interactor/dashboard/fetch_feed_interactor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed.g.dart';

@riverpod
Future<List<Tweet>> feed(FeedRef ref) {
  return ref.watch(fetchFeedInteractorProvider).fetchFeedTimeline();
}
