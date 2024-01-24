import 'package:flutter_dasher/common/model/tweet.dart';
import 'package:flutter_dasher/domain/interactor/profile/profile_tweets_interactor_impl.dart';
import 'package:flutter_dasher/domain/repository/profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_tweets_interactor.g.dart';

@riverpod
ProfileTweetsInteractor profileTweetsInteractor(ProfileTweetsInteractorRef ref) {
  return ProfileTweetsInteractorImpl(ref.watch(profileRepositoryProvider));
}

abstract class ProfileTweetsInteractor {
  Future<List<Tweet>> fetchProfileTweets();
}
