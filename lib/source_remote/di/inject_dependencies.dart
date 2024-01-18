import 'package:flutter_dasher/domain/repository/login_repository.dart';
import 'package:flutter_dasher/domain/repository/new_tweet_repository.dart';
import 'package:flutter_dasher/source_remote/impl/login_repository_impl.dart';
import 'package:flutter_dasher/source_remote/impl/new_tweet_repository_impl.dart';
import 'package:flutter_dasher/source_remote/twitter/create_twitter_oauth.dart';
import 'package:flutter_dasher/source_remote/twitter/twitter_api_container.dart';
import 'package:get_it/get_it.dart';

void injectDependencies(GetIt getIt) {
  getIt.registerFactory<LoginRepository>(
    () => LoginRepositoryImpl(getIt.get(), getIt.get()),
  );

  // TODO: Remove unused repositories
  // Keeping the commented code and unused repositories for now for reference.

  // getIt.registerFactory<FeedRepository>(
  //   () => FeedRepositoryImpl(getIt.get(), getIt.get()),
  // );

  // getIt.registerFactory<ProfileRepository>(
  //   () => ProfileRepositoryImpl(getIt.get(), getIt.get()),
  // );

  getIt.registerFactory<NewTweetRepository>(
    () => NewTweetRepositoryImpl(getIt.get()),
  );

  getIt.registerLazySingleton<TwitterApiContainer>(
    () => TwitterApiContainer(),
  );

  getIt.registerLazySingleton(
    () => createTwitterOAuth(),
  );
}
