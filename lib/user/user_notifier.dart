import 'package:flutter_dasher/twitter_api/twitter_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart';

part 'user_notifier.g.dart';

@Riverpod(keepAlive: true)
class UserNotifier extends _$UserNotifier {
  @override
  FutureOr<User> build() async {
    final twitterApi = ref.read(twitterApiProvider);

    final userResponse = await twitterApi.users.lookupMe(
      userFields: [
        UserField.profileImageUrl,
        UserField.description,
        UserField.publicMetrics,
      ],
    );

    return User(
      id: userResponse.data.id,
      name: userResponse.data.name,
      username: userResponse.data.username,
      imageUrl: userResponse.data.profileImageUrl?.replaceAll('normal', '400x400'),
      description: userResponse.data.description,
      followers: userResponse.data.publicMetrics?.followersCount,
      following: userResponse.data.publicMetrics?.followingCount,
    );
  }
}

@JsonSerializable()
class User {
  User({
    required this.id,
    required this.name,
    required this.username,
    this.imageUrl,
    this.description,
    this.followers,
    this.following,
  });

  final String id;
  final String name;
  final String username;
  final String? imageUrl;
  final String? description;
  final int? followers;
  final int? following;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
