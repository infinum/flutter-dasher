import 'package:flutter_dasher/common/model/tweet.dart';
import 'package:flutter_dasher/domain/interactor/profile/profile_tweets_interactor.dart';
import 'package:flutter_dasher/ui/common/bits/request_provider/request_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final profileRequestProvider = ChangeNotifierProvider.autoDispose<ProfileRequestProvider>(
  (ref) => ProfileRequestProvider(GetIt.instance.get()),
);

class ProfileRequestProvider extends RequestProvider<List<Tweet>> {
  ProfileRequestProvider(this._profileTweetsInteractor) {
    fetchProfileTweets();
  }

  final ProfileTweetsInteractor _profileTweetsInteractor;

  Future<void> fetchProfileTweets() {
    return executeRequest(requestBuilder: _profileTweetsInteractor.fetchProfileTweets);
  }
}
