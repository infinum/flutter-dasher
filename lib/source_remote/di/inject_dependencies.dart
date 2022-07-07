import 'package:flutter_dasher/domain/repository/login_repository.dart';
import 'package:flutter_dasher/domain/repository/profile_repository.dart';
import 'package:flutter_dasher/source_remote/impl/login_repository_impl.dart';
import 'package:flutter_dasher/source_remote/impl/profile_repository_impl.dart';
import 'package:get_it/get_it.dart';

import '../../domain/repository/feed_repository.dart';
import '../impl/feed_repository_impl.dart';
import '../twitter/create_twitter_oauth.dart';

void injectDependencies(GetIt getIt) {
  getIt.registerFactory<LoginRepository>(
    () => LoginRepositoryImpl(getIt.get()),
  );

  getIt.registerFactory<FeedRepository>(
    () => FeedRepositoryImpl(getIt.get()),
  );

  getIt.registerFactory<ProfileRepository>(
    () => ProfileRepositoryImpl(getIt.get()),
  );

  getIt.registerLazySingleton(
    () => createTwitterOAuth(),
  );
}
