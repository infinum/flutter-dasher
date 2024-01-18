import 'package:flutter_dasher/common/model/tweet.dart';
import 'package:flutter_dasher/source_dev/dev_feed_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_repository.g.dart';

@Riverpod(keepAlive: true)
FeedRepository feedRepository(FeedRepositoryRef ref) {
  return DevFeedRepository();
}

abstract class FeedRepository {
  Future<List<Tweet>> fetchFeedTimeline();
}
