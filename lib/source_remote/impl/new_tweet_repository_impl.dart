import 'package:flutter_dasher/common/model/new_tweet.dart';
import 'package:flutter_dasher/domain/repository/new_tweet_repository.dart';
import 'package:flutter_dasher/source_remote/twitter/twitter_api_container.dart';

class NewTweetRepositoryImpl implements NewTweetRepository {
  NewTweetRepositoryImpl(this.twitterApiContainer);

  final TwitterApiContainer twitterApiContainer;

  @override
  Future<void> postNewTweet(NewTweet newTweet) async {
    twitterApiContainer.getTwitterApi().tweetsService.createTweet(text: newTweet.tweetText);
  }
}
