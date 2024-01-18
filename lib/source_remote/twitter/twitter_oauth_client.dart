import 'package:flutter_dasher/common/flavor/flavor_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:twitter_oauth2_pkce/twitter_oauth2_pkce.dart';

part 'twitter_oauth_client.g.dart';

@Riverpod(keepAlive: true)
TwitterOAuth2Client twitterOAuthClient(TwitterOAuthClientRef ref) {
  return TwitterOAuth2Client(
    clientId: FlavorConfig.instance.values.clientId,
    clientSecret: FlavorConfig.instance.values.clientSecret,
    redirectUri: FlavorConfig.instance.values.redirectUri,
    customUriScheme: FlavorConfig.instance.values.customUriScheme,
  );
}
