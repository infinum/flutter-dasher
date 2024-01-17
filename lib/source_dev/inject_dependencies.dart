import 'package:flutter_dasher/domain/repository/feed_repository.dart';
import 'package:flutter_dasher/domain/repository/profile_repository.dart';
import 'package:flutter_dasher/source_dev/dev_feed_repository.dart';
import 'package:flutter_dasher/source_dev/dev_profile_repository.dart';
import 'package:get_it/get_it.dart';

void injectDependencies(GetIt getIt) {
  getIt.registerLazySingleton<ProfileRepository>(
    () => DevProfileRepository(),
  );

  getIt.registerLazySingleton<FeedRepository>(
    () => DevFeedRepository(),
  );
}
