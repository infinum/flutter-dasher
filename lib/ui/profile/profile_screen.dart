import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dasher/ui/common/dasher_bottom_navigation_bar.dart';
import 'package:flutter_dasher/ui/common/dasher_new_tweet_button.dart';
import 'package:flutter_dasher/ui/common/dasher_tweet.dart';
import 'package:flutter_dasher/ui/dashboard/provider/current_user_provider.dart';
import 'package:flutter_dasher/ui/profile/provider/profile_request_provider.dart';
import 'package:flutter_dasher/ui/profile/widget/header_bar_component.dart';
import 'package:flutter_dasher/ui/profile/widget/profile_info_component.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
    final _provider = ref.watch(profileRequestProvider);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: ref.read(profileRequestProvider).fetchProfileTweets,
          child: CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: [
              SliverPersistentHeader(
                delegate: HeaderBar(
                  expandedHeight: 138,
                  shrinkHeight: 100,
                  profileName: user?.name,
                  avatarURL: user?.imageUrl,
                ),
                pinned: true,
              ),
              SliverToBoxAdapter(
                child: ProfileInfo(
                  name: user?.name,
                  usernameTag: '@${user?.username}',
                  bio: user?.description,
                  following: user?.following.toString(),
                  followers: user?.followers.toString(),
                ),
              ),
              _provider.state.maybeWhen(
                orElse: () => const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                success: (tweets) => SliverList(
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
                ),
                failure: (e) => SliverFillRemaining(
                  child: Center(
                    child: Text('Error occurred $e'),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: const DasherNewTweetButton(),
        bottomNavigationBar: const DasherBottomNavigationBar(),
      ),
    );
  }
}
