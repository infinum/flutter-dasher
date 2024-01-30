import 'package:flutter_dasher/twitter/feed_notifier.dart';
import 'package:flutter_dasher/twitter/model/tweet.dart';
import 'package:flutter_dasher/twitter_api/twitter_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_mutations_annotation/riverpod_mutations_annotation.dart';

part 'user_tweets_notifier.g.dart';

@riverpod
class UserTweetsNotifier extends _$UserTweetsNotifier {
  @override
  FutureOr<List<Tweet>> build() async {
    await Future.delayed(const Duration(seconds: 3));

    return [
      _createTweet(text: 'Tweet 0'),
      _createTweet(text: 'Tweet 1'),
      _createTweet(text: 'Tweet 2'),
      _createTweet(text: 'Tweet 3'),
      _createTweet(text: 'Tweet 4'),
      _createTweet(text: 'Tweet 5'),
    ];
  }

  @mutation
  Future<void> postNewTweet(String tweet) async {
    await ref.read(twitterApiProvider).tweets.createTweet(text: tweet);
    ref.invalidateSelf();
    ref.invalidate(feedNotifierProvider);
  }

  Tweet _createTweet({
    required String text,
  }) {
    return Tweet(
      '1',
      text,
      'https://pbs.twimg.com/profile_images/562305884731105280/TjYLM95x_400x400.png',
      'Jim',
      'jim_x',
      10,
      11,
      12,
      '2023.1.1 12:00',
    );
  }
}
