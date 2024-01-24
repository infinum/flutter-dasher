import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dasher/common/model/tweet.dart';
import 'package:flutter_dasher/ui/common/dasher_bottom_navigation_bar.dart';
import 'package:flutter_dasher/ui/common/dasher_new_tweet_button.dart';
import 'package:flutter_dasher/ui/common/dasher_tweet.dart';
import 'package:flutter_dasher/ui/dashboard/presenter/current_user.dart';
import 'package:flutter_dasher/ui/profile/presenter/profile_tweets.dart';
import 'package:flutter_dasher/ui/profile/widget/header_bar_component.dart';
import 'package:flutter_dasher/ui/profile/widget/profile_info_component.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  static Route route() {
    return MaterialPageRoute<dynamic>(
      builder: (BuildContext context) {
        return const ProfileScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final tweets = ref.watch(profileTweetsProvider);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () => ref.refresh(profileTweetsProvider.future),
          child: CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: [
              SliverPersistentHeader(
                delegate: HeaderBar(
                  expandedHeight: 138,
                  shrinkHeight: 100,
                  profileName: user.name,
                  avatarURL: user.imageUrl,
                ),
                pinned: true,
              ),
              SliverToBoxAdapter(
                child: ProfileInfo(
                  name: user.name,
                  usernameTag: '@${user.username}',
                  bio: user.description,
                  following: user.following.toString(),
                  followers: user.followers.toString(),
                ),
              ),
              switch (tweets) {
                AsyncData(:final value) => _TweetsList(
                    tweets: value,
                  ),
                AsyncError(:final error, isLoading: false) => SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text('Error occurred: $error'),
                    ),
                  ),
                _ => const _LoadingIndicator(),
              },
            ],
          ),
        ),
        floatingActionButton: const DasherNewTweetButton(),
        bottomNavigationBar: const DasherBottomNavigationBar(),
      ),
    );
  }
}

class _TweetsList extends StatelessWidget {
  const _TweetsList({
    Key? key,
    required this.tweets,
  }) : super(key: key);

  final List<Tweet> tweets;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return DasherTweet(
            avatarURL: tweets[index].profileImageUrl,
            name: tweets[index].name,
            usernameTag: tweets[index].username,
            createdAt: tweets[index].createdAt,
            tweetText: tweets[index].text,
            commentsCount: tweets[index].replyCount.toString(),
            retweetsCount: tweets[index].retweetCount.toString(),
            likesCount: tweets[index].likeCount.toString(),
          );
        },
        childCount: tweets.length, // 1000 list items
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
