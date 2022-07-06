import 'package:flutter_dasher/common/model/tweet.dart';

abstract class FetchFeedInteractor {
  Future<List<Tweet>> fetchFeedTimeline();
}
