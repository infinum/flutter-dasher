// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_notifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      imageUrl: json['imageUrl'] as String?,
      description: json['description'] as String?,
      followers: json['followers'] as int?,
      following: json['following'] as int?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'followers': instance.followers,
      'following': instance.following,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userNotifierHash() => r'8ad2b50db5aaf0040712aa1e1dfacd2ace28b24a';

/// See also [UserNotifier].
@ProviderFor(UserNotifier)
final userNotifierProvider = AsyncNotifierProvider<UserNotifier, User>.internal(
  UserNotifier.new,
  name: r'userNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserNotifier = AsyncNotifier<User>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
