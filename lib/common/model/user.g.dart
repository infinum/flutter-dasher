// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

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
