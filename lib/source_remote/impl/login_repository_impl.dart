import 'package:flutter_dasher/domain/repository/login_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart';
import 'package:twitter_oauth2_pkce/twitter_oauth2_pkce.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl(this.twitterOAuth2Client);

  final TwitterOAuth2Client twitterOAuth2Client;

  @override
  Future<void> login() async {
    final response = await twitterOAuth2Client.executeAuthCodeFlowWithPKCE(
      scopes: Scope.values,
    );

    GetIt.instance.registerSingleton(TwitterApi(bearerToken: response.accessToken));
  }
}
