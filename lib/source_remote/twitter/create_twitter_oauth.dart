import 'package:twitter_oauth2_pkce/twitter_oauth2_pkce.dart';

import '../../common/flavor/flavor_config.dart';

TwitterOAuth2Client createTwitterOAuth() {
  return TwitterOAuth2Client(
    clientId: FlavorConfig.instance.values.clientId,
    clientSecret: FlavorConfig.instance.values.clientSecret,
    redirectUri: FlavorConfig.instance.values.redirectUri,
    customUriScheme: FlavorConfig.instance.values.customUriScheme,
  );
}
