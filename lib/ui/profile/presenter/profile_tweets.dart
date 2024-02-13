import 'package:flutter_dasher/common/model/tweet.dart';
import 'package:flutter_dasher/domain/interactor/profile/profile_tweets_interactor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_tweets.g.dart';

@riverpod
Future<List<Tweet>> profileTweets(ProfileTweetsRef ref) {
  return ref.watch(profileTweetsInteractorProvider).fetchProfileTweets();
}
