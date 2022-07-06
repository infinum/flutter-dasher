import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({
    required this.id,
    this.name,
    this.username,
    this.imageUrl,
  });

  final String id;
  final String? name;
  final String? username;
  final String? imageUrl;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
