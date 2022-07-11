import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_tweet.g.dart';

@JsonSerializable()
class NewTweet {
  NewTweet(this.tweetText);

  factory NewTweet.fromJson(Map<String, dynamic> json) => _$NewTweetFromJson(json);

  final String tweetText;
}
