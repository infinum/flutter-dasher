import 'package:flutter/material.dart';
import 'package:flutter_dasher/common/model/new_tweet.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final newTweetProvider = ChangeNotifierProvider.autoDispose(
  (ref) => NewTweetProvider(),
);

class NewTweetProvider extends ChangeNotifier {
  NewTweetProvider({String tweetText = ''}) : _tweetText = tweetText;

  String _tweetText;
  String get tweetText => _tweetText;

  void onNewTweetChanged(String tweetText) {
    _tweetText = tweetText;
  }

  NewTweet buildNewTweetPost() {
    return NewTweet(tweetText);
  }
}
