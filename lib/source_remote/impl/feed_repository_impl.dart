import 'package:flutter_dasher/common/model/tweet.dart';
import 'package:flutter_dasher/domain/data/user_data_holder.dart';
import 'package:flutter_dasher/domain/repository/feed_repository.dart';
import 'package:flutter_dasher/source_remote/twitter/twitter_api_container.dart';
import 'package:intl/intl.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart';

class FeedRepositoryImpl implements FeedRepository {
  FeedRepositoryImpl(this.twitterApiContainer, this.userDataHolder);

  final TwitterApiContainer twitterApiContainer;
  final UserDataHolder userDataHolder;

  @override
  Future<List<Tweet>> fetchFeedTimeline() async {
    final response = await twitterApiContainer.getTwitterApi().tweetsService.lookupHomeTimeline(
      userId: userDataHolder.user!.id,
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

    return _getTweetsListWithAuthors(response);
  }

  List<Tweet> _getTweetsListWithAuthors(TwitterResponse<List<TweetData>, TweetMeta> response) {
    return response.data.map((tweet) {
      final UserData user = _getUserForTweet(response.includes?.users, tweet);

      // Extend tweet data with user data related to that tweet
      return Tweet(
        tweet.id,
        tweet.text,
        user.profileImageUrl?.replaceAll('normal', '400x400'),
        user.name,
        user.username,
        tweet.publicMetrics!.likeCount,
        tweet.publicMetrics!.retweetCount,
        tweet.publicMetrics!.replyCount,
        DateFormat.MMMd().format(tweet.createdAt!),
      );
    }).toList();
  }

  //  From authorId inside the tweet find a matching user from the list of all unique users who posted those tweets
  UserData _getUserForTweet(List<UserData>? users, TweetData tweet) => users!.singleWhere((user) => user.id == tweet.authorId);
}
