import 'package:flutter_dasher/common/model/new_tweet.dart';
import 'package:flutter_dasher/source_remote/impl/new_tweet_repository_impl.dart';
import 'package:flutter_dasher/source_remote/twitter/twitter_api_container.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'new_tweet_repository.g.dart';

@Riverpod(keepAlive: true)
NewTweetRepository newTweetRepository(NewTweetRepositoryRef ref) {
  return NewTweetRepositoryImpl(ref.watch(twitterApiContainerProvider));
}

abstract class NewTweetRepository {
  Future<void> postNewTweet(NewTweet newTweet);
}
