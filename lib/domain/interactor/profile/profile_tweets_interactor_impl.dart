import 'package:flutter_dasher/common/model/tweet.dart';
import 'package:flutter_dasher/domain/interactor/profile/profile_tweets_interactor.dart';
import 'package:flutter_dasher/domain/repository/profile_repository.dart';

class ProfileTweetsInteractorImpl implements ProfileTweetsInteractor {
  ProfileTweetsInteractorImpl(this._profileRepository);

  final ProfileRepository _profileRepository;

  @override
  Future<List<Tweet>> fetchProfileTweets() {
    return _profileRepository.fetchProfileTweets();
  }
}
