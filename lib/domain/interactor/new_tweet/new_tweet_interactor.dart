import 'package:flutter_dasher/common/model/new_tweet.dart';
import 'package:flutter_dasher/domain/interactor/new_tweet/new_tweet_interactor_impl.dart';
import 'package:flutter_dasher/domain/repository/new_tweet_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'new_tweet_interactor.g.dart';

@riverpod
NewTweetInteractor newTweetInteractor(NewTweetInteractorRef ref) {
  return NewTweetInteractorImpl(ref.read(newTweetRepositoryProvider));
}

abstract class NewTweetInteractor {
  Future<void> postNewTweet(NewTweet newTweet);
}
