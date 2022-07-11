import 'package:flutter_dasher/common/model/new_tweet.dart';
import 'package:flutter_dasher/domain/interactor/new_tweet/new_tweet_interactor.dart';
import 'package:flutter_dasher/domain/repository/new_tweet_repository.dart';

class NewTweetInteractorImpl implements NewTweetInteractor {
  NewTweetInteractorImpl(this._newTweetRepository);

  final NewTweetRepository _newTweetRepository;

  @override
  Future<void> postNewTweet(NewTweet newTweet) async {
    await _newTweetRepository.postNewTweet(newTweet);
  }
}
