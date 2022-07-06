import 'package:flutter_dasher/common/model/tweet.dart';

abstract class ProfileRepository {
  Future<List<Tweet>> fetchProfileTweets();
}
