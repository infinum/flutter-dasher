import 'package:flutter_dasher/common/model/new_tweet.dart';

abstract class NewTweetInteractor {
  Future<void> postNewTweet(NewTweet newTweet);
}
