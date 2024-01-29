import 'package:flutter_dasher/twitter/model/tweet.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_notifier.g.dart';

@riverpod
Future<List<Tweet>> feedNotifier(FeedNotifierRef ref) async {
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

Tweet _createTweet({
  required String text,
}) {
  return Tweet(
    '1',
    text,
    'https://pbs.twimg.com/profile_images/562305884731105280/TjYLM95x_400x400.png',
    'John',
    'john_x',
    10,
    11,
    12,
    '2023.1.1 12:00',
  );
}
