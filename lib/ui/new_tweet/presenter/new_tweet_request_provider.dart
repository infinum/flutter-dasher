import 'package:flutter_dasher/domain/interactor/new_tweet/new_tweet_interactor.dart';
import 'package:flutter_dasher/ui/common/bits/request_provider/request_provider.dart';
import 'package:flutter_dasher/ui/new_tweet/presenter/new_tweet_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final newTweetRequestPresenter =
    ChangeNotifierProvider.autoDispose((ref) => NewTweetRequestPresenter(GetIt.instance.get(), ref));

class NewTweetRequestPresenter extends RequestProvider<void> {
  NewTweetRequestPresenter(this._newTweetInteractor, this._ref);

  final NewTweetInteractor _newTweetInteractor;
  final Ref _ref;

  Future<void> postNewTweet() {
    return executeRequest(requestBuilder: () async {
      final presenter = _ref.read(newTweetPresenter);
      return await _newTweetInteractor.postNewTweet(presenter.buildNewTweetPost());
    });
  }
}
