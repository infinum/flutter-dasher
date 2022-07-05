import 'package:flutter_dasher/domain/repository/feed_repository.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart';

class FeedRepositoryImpl implements FeedRepository {
  FeedRepositoryImpl(this.twitterApi);

  final TwitterApi twitterApi;
}
