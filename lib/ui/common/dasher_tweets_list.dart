import 'package:flutter/material.dart';
import 'package:flutter_dasher/ui/common/dasher_tweet.dart';
import 'package:flutter_dasher/ui/dashboard/provider/feed_request_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DasherTweetsList extends ConsumerWidget {
  const DasherTweetsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feed = ref.watch(feedRequestProvider).feed;

    return Center(
      child: RefreshIndicator(
        onRefresh: ref.read(feedRequestProvider).fetchTweetsTimeline,
        child: ListView.builder(
          itemCount: feed.length,
          itemBuilder: (context, index) {
            return DasherTweet(
              avatarURL: feed[index].profileImageUrl,
              username: feed[index].name,
              usernameTag: feed[index].username,
              tweetTime: feed[index].createdAt,
              tweetText: feed[index].text,
              commentsCount: feed[index].replyCount.toString(),
              retweetsCount: feed[index].retweetCount.toString(),
              likesCount: feed[index].likeCount.toString(),
            );
          },
        ),
      ),
    );
  }
}
