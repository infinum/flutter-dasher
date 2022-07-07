import 'package:flutter_dasher/common/model/tweet.dart';
import 'package:flutter_dasher/domain/data/user_data_holder.dart';
import 'package:flutter_dasher/domain/repository/profile_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this.twitterApi);

  final TwitterApi twitterApi;

  @override
  Future<List<Tweet>> fetchProfileTweets() async {
    var user = GetIt.instance.get<UserDataHolder>().user;

    final response = await twitterApi.tweetsService.lookupTweets(
      userId: user!.id,
      tweetFields: [
        TweetField.publicMetrics,
        TweetField.createdAt,
      ],
      userFields: [
        UserField.createdAt,
        UserField.profileImageUrl,
      ],
      expansions: [
        TweetExpansion.authorId,
      ],
    );

    return response.data.map((tweet) {
      final UserData? user = response.includes?.users?.singleWhere((user) => user.id == tweet.authorId);

      return Tweet(
        tweet.id,
        tweet.text,
        user!.profileImageUrl,
        user.name,
        user.username,
        tweet.publicMetrics!.likeCount,
        tweet.publicMetrics!.retweetCount,
        tweet.publicMetrics!.replyCount,
        DateFormat.MMMd().format(tweet.createdAt!),
      );
    }).toList();
  }
}
