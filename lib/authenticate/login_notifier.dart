import 'package:flutter_dasher/authentication/authentication_manager.dart';
import 'package:flutter_dasher/twitter_api/twitter_oauth_client.dart';
import 'package:flutter_dasher/user/user_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_mutations_annotation/riverpod_mutations_annotation.dart';
import 'package:twitter_oauth2_pkce/twitter_oauth2_pkce.dart';

part 'login_notifier.g.dart';

@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  void build() {}

  @mutation
  Future<void> login() async {
    final oAuthClient = ref.read(twitterOAuthClientProvider);
    final oAuthResponse = await oAuthClient.executeAuthCodeFlowWithPKCE(scopes: Scope.values);
    ref.read(authenticationManagerProvider.notifier).onAuthenticated(accessToken: oAuthResponse.accessToken);
    await ref.read(userNotifierProvider.future);
  }
}
