import 'package:flutter_dasher/common/model/user.dart';
import 'package:flutter_dasher/source_remote/impl/login_repository_impl.dart';
import 'package:flutter_dasher/source_remote/twitter/twitter_api_container.dart';
import 'package:flutter_dasher/source_remote/twitter/twitter_oauth_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_repository.g.dart';

@Riverpod(keepAlive: true)
LoginRepository loginRepository(LoginRepositoryRef ref) {
  return LoginRepositoryImpl(ref.watch(twitterOAuthClientProvider), ref.watch(twitterApiContainerProvider));
}

abstract class LoginRepository {
  Future<User> login();
}
