import 'package:flutter/material.dart';
import 'package:flutter_dasher/common/model/tweet.dart';
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
        success: (feed) => _TweetsList(
          feed: feed,
        ),
        initial: () => const CircularProgressIndicator(),
        loading: (feed) {
          if (feed == null) {
            return const CircularProgressIndicator();
          } else {
            return _TweetsList(
              feed: feed,
            );
          }
        },
        failure: (e) => Text('Error occurred $e'),
        orElse: () => const CircularProgressIndicator(),
      ),
    );
  }
}

class _TweetsList extends ConsumerWidget {
  const _TweetsList({
    Key? key,
    required this.feed,
  }) : super(key: key);

  final List<Tweet> feed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
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
    );
  }
}
