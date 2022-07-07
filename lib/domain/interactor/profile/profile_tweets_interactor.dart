import 'package:flutter_dasher/common/model/tweet.dart';

abstract class ProfileTweetsInteractor {
  Future<List<Tweet>> fetchProfileTweets();
}
