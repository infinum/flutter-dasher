import 'package:freezed_annotation/freezed_annotation.dart';

part 'tweet.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake, createToJson: false)
class Tweet {
  Tweet(
    this.id,
    this.text,
    this.profileImageUrl,
    this.name,
    this.username,
    this.likeCount,
    this.retweetCount,
    this.replyCount,
    this.createdAt,
  );

  final String id;
  final String text;
  final String? profileImageUrl;
  final String? name;
  final String? username;
  final int likeCount;
  final int retweetCount;
  final int replyCount;
  final String? createdAt;

  factory Tweet.fromJson(Map<String, dynamic> json) => _$TweetFromJson(json);
}
