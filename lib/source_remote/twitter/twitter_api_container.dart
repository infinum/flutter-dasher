import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart';

part 'twitter_api_container.g.dart';

@Riverpod(keepAlive: true)
TwitterApiContainer twitterApiContainer(TwitterApiContainerRef _) {
  return TwitterApiContainer();
}

class TwitterApiContainer {
  TwitterApi? _twitterApi;

  void setTwitterApi(TwitterApi twitterApi) {
    _twitterApi = twitterApi;
  }

  TwitterApi getTwitterApi() {
    if (_twitterApi == null) throw Exception('Twitter was null you need to login first to obtain instance.');
    return _twitterApi!;
  }
}
