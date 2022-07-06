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
    final _provider = ref.watch(feedRequestProvider);

    return Center(
      child: _provider.state.maybeWhen(
        success: (feed) => RefreshIndicator(
          onRefresh: ref.read(feedRequestProvider).fetchTweetsTimeline,
          child: ListView.builder(
            itemCount: feed.length,
            itemBuilder: (context, index) {
              return DasherTweet(
                avatarURL: feed[index].profileImageUrl,
                name: feed[index].name,
                usernameTag: feed[index].username,
                createdAt: feed[index].createdAt,
                tweetText: feed[index].text,
                commentsCount: feed[index].replyCount.toString(),
                retweetsCount: feed[index].retweetCount.toString(),
                likesCount: feed[index].likeCount.toString(),
              );
            },
          ),
        ),
        orElse: () => const CircularProgressIndicator(),
        failure: (e) => Text('Error occurred $e'),
      ),
    );
  }
}
