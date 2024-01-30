import 'package:flutter/material.dart';
import 'package:flutter_dasher/twitter/feed_notifier.dart';
import 'package:flutter_dasher/twitter/model/tweet.dart';
import 'package:flutter_dasher/ui/common/dasher_tweet.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DasherTweetsList extends ConsumerWidget {
  const DasherTweetsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feed = ref.watch(feedNotifierProvider);

    return Center(
      child: switch (feed) {
        AsyncData(:final value) => _TweetsList(
            onRefresh: () => ref.refresh(feedNotifierProvider.future),
            tweets: value,
          ),
        AsyncError(:final error, isLoading: false) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Error occurred: $error'),
              ElevatedButton(
                onPressed: () => ref.refresh(feedNotifierProvider),
                child: const Text('Refresh'),
              ),
            ],
          ),
        _ => const CircularProgressIndicator(),
      },
    );
  }
}

class _TweetsList extends ConsumerWidget {
  const _TweetsList({
    required this.onRefresh,
    required this.tweets,
  });

  final Future<void> Function() onRefresh;
  final List<Tweet> tweets;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        itemCount: tweets.length,
        itemBuilder: (context, index) {
          final tweet = tweets[index];
          return DasherTweet(
            avatarURL: tweet.profileImageUrl,
            name: tweet.name,
            usernameTag: tweet.username,
            createdAt: tweet.createdAt,
            tweetText: tweet.text,
            commentsCount: tweet.replyCount.toString(),
            retweetsCount: tweet.retweetCount.toString(),
            likesCount: tweet.likeCount.toString(),
          );
        },
      ),
    );
  }
}
