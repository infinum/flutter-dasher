import 'package:flutter_dasher/domain/data/user_data_holder.dart';
import 'package:flutter_dasher/domain/interactor/dashboard/fetch_feed_interactor.dart';
import 'package:flutter_dasher/domain/interactor/dashboard/fetch_feed_interactor_impl.dart';
import 'package:flutter_dasher/domain/interactor/login/login_interactor.dart';
import 'package:flutter_dasher/domain/interactor/login/login_interactor_impl.dart';
import 'package:flutter_dasher/domain/interactor/profile/profile_tweets_interactor.dart';
import 'package:flutter_dasher/domain/interactor/profile/profile_tweets_interactor_impl.dart';
import 'package:get_it/get_it.dart';

void injectDependencies(GetIt getIt) {
  getIt.registerLazySingleton<UserDataHolder>(
    () => UserDataHolder(),
  );

  getIt.registerFactory<LoginInteractor>(
    () => LoginInteractorImpl(
      getIt.get(),
      getIt.get(),
    ),
  );

  getIt.registerFactory<FetchFeedInteractor>(
    () => FetchFeedInteractorImpl(
      getIt.get(),
    ),
  );

  getIt.registerFactory<ProfileTweetsInteractor>(
    () => ProfileTweetsInteractorImpl(
      getIt.get(),
    ),
  );
}
