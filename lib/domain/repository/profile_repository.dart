import 'package:flutter_dasher/common/model/tweet.dart';
import 'package:flutter_dasher/source_dev/dev_profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_repository.g.dart';

@Riverpod(keepAlive: true)
ProfileRepository profileRepository(ProfileRepositoryRef ref) {
  return DevProfileRepository();
}

abstract class ProfileRepository {
  Future<List<Tweet>> fetchProfileTweets();
}
