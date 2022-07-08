import 'package:flutter_dasher/common/model/new_tweet.dart';

abstract class NewTweetRepository {
  Future<void> postNewTweet(NewTweet newTweet);
}
