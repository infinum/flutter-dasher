import 'package:flutter_dasher/common/model/new_tweet.dart';
import 'package:flutter_dasher/domain/repository/new_tweet_repository.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart';

class NewTweetRepositoryImpl implements NewTweetRepository {
  NewTweetRepositoryImpl(this.twitterApi);

  final TwitterApi twitterApi;

  @override
  Future<void> postNewTweet(NewTweet newTweet) async {
    twitterApi.tweetsService.createTweet(text: newTweet.tweetText);
  }
}
