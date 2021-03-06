import 'package:flutter_dasher/common/model/tweet.dart';

abstract class FeedRepository {
  Future<List<Tweet>> fetchFeedTimeline();
}
