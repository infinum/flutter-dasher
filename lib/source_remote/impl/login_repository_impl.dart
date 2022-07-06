import 'package:flutter_dasher/common/model/user.dart';
import 'package:flutter_dasher/domain/repository/login_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart' as v2;
import 'package:twitter_oauth2_pkce/twitter_oauth2_pkce.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl(this.twitterOAuth2Client);

  final TwitterOAuth2Client twitterOAuth2Client;

  @override
  Future<User> login() async {
    final response = await twitterOAuth2Client.executeAuthCodeFlowWithPKCE(
      scopes: Scope.values,
    );

    final twitter = v2.TwitterApi(bearerToken: response.accessToken);

    GetIt.instance.registerSingleton(twitter);

    final userResponse = await twitter.usersService.lookupMe(
      userFields: [
        v2.UserField.profileImageUrl,
        v2.UserField.description,
        v2.UserField.publicMetrics,
      ],
    );

    return User(
      id: userResponse.data.id,
      name: userResponse.data.name,
      username: userResponse.data.username,
      imageUrl: userResponse.data.profileImageUrl,
      description: userResponse.data.description,
      followers: userResponse.data.publicMetrics?.followersCount,
      following: userResponse.data.publicMetrics?.followingCount,
    );
  }
}
