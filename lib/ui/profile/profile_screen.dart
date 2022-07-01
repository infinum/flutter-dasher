import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dasher/ui/common/dasher_bottom_navigation_bar.dart';
import 'package:flutter_dasher/ui/common/dasher_new_tweet_button.dart';
import 'package:flutter_dasher/ui/common/dasher_tweet.dart';
import 'package:flutter_dasher/ui/common/look/widget/look.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<dynamic>(
      builder: (BuildContext context) {
        return const ProfileScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverPersistentHeader(
              delegate: _HeaderBar(
                expandedHeight: 138,
                shrinkHeight: 100,
                profileName: 'Profile Name',
                avatarURL: 'https://source.unsplash.com/random/200x200?sig=1',
              ),
              pinned: true,
            ),
            const SliverToBoxAdapter(
              child: _ProfileInfo(
                username: 'Username',
                usernameTag: '@username',
                bio: 'Digital Goodies Team - Web & Mobile UI/UX development; Graphics; Illustrations',
                following: '217',
                followers: '99',
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return const DasherTweet(
                    avatarURL: 'https://source.unsplash.com/random/200x200?sig=2',
                    username: 'Username',
                    usernameTag: '@username',
                    tweetTime: '30m',
                    tweetText:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    commentsCount: '15',
                    retweetsCount: '20',
                    likesCount: '25',
                  );
                },
                childCount: 10, // 1000 list items
              ),
            )
          ],
        ),
        floatingActionButton: const DasherNewTweetButton(),
        bottomNavigationBar: const DasherBottomNavigationBar(),
      ),
    );
  }
}

class _ProfileInfo extends StatelessWidget {
  const _ProfileInfo({
    Key? key,
    required this.username,
    required this.usernameTag,
    this.bio,
    required this.following,
    required this.followers,
  }) : super(key: key);

  final String username;
  final String usernameTag;
  final String? bio;
  final String following;
  final String followers;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        top: 55,
        right: 20,
        bottom: 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            username,
            style: Look.of(context).typography.h3.copyWith(color: Look.of(context).color.onBackground),
          ),
          const SizedBox(height: 4),
          Text(
            usernameTag,
            style: Look.of(context).typography.tweetBody.copyWith(color: Look.of(context).color.symbolGray),
          ),
          const SizedBox(height: 15),
          if (bio != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 38.0),
              child: Text(
                bio!,
                style: Look.of(context).typography.tweetBody.copyWith(color: Look.of(context).color.onBackground),
              ),
            ),
          Row(
            children: [
              _FollowCounter(counter: following, text: 'Following'),
              _FollowCounter(counter: followers, text: 'Followers'),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _FollowCounter extends StatelessWidget {
  const _FollowCounter({
    Key? key,
    required this.counter,
    required this.text,
  }) : super(key: key);

  final String? counter;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: RichText(
        text: TextSpan(
          text: '$counter ',
          style: Look.of(context).typography.tweetBold.copyWith(color: Look.of(context).color.onBackground),
          children: <TextSpan>[
            TextSpan(
              text: text,
              style: Look.of(context).typography.tweetBody.copyWith(color: Look.of(context).color.symbolGray),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderBar extends SliverPersistentHeaderDelegate {
  _HeaderBar({
    required this.expandedHeight,
    required this.shrinkHeight,
    required this.profileName,
    required this.avatarURL,
  });

  final double expandedHeight;
  final double shrinkHeight;
  final String profileName;
  final String avatarURL;

  // Distance in points from maximum expanded header to minimum shrunk header
  double get _distanceToShrink => expandedHeight - shrinkHeight;

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => shrinkHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Look.of(context).color.header,
          ),
        ),
        Positioned(
          top: _calculateHeaderTextTopPosition(shrinkOffset),
          child: Text(
            profileName,
            style: Look.of(context).typography.headerLabel.copyWith(color: Look.of(context).color.onHeader),
          ),
        ),
        Positioned(
          top: _calculateAvatarTopPosition(shrinkOffset),
          left: 20,
          child: Opacity(
            opacity: _calculateAvatarOpacity(shrinkOffset),
            child: Container(
              decoration: BoxDecoration(
                color: Look.of(context).color.onSurface,
                image: DecorationImage(
                  image: NetworkImage(avatarURL),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Look.of(context).color.background,
                  width: 4,
                ),
              ),
              child: SizedBox(
                height: expandedHeight,
                width: 70,
              ),
            ),
          ),
        ),
        Positioned(
          top: 42,
          left: 14,
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              minimumSize: Size.zero,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(8),
              primary: Look.of(context).color.black, // <-- Button color
            ),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Look.of(context).color.background,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }

  double _calculateHeaderTextTopPosition(double shrinkOffset) {
    // Value from 1 to 0, when header is maximum extended value is 1, on shrunk header value is 0
    final double revertedProgressToShrink = 1 - shrinkOffset / _distanceToShrink;

    // Offset from center for text on extended header
    const double textExtendedOffset = 10;

    // Animate text top position from extended to shrunk, when header is shrunk text stays always in the middle of header
    if (shrinkOffset < _distanceToShrink) {
      return expandedHeight / 2 - shrinkOffset / 2 - textExtendedOffset * revertedProgressToShrink;
    } else {
      return shrinkHeight / 2;
    }
  }

  double _calculateAvatarTopPosition(double shrinkOffset) {
    // Correct top distance of avatar when header is shrunk
    final double avatarPositionOnShrunk = shrinkHeight / 2 - 20;

    // Animate avatar top position from extended to shrunk, when the header is shrunk avatar stays always on the header bottom line
    if (shrinkOffset < _distanceToShrink) {
      return expandedHeight / 2 - shrinkOffset;
    } else {
      return avatarPositionOnShrunk;
    }
  }

  double _calculateAvatarOpacity(double shrinkOffset) {
    // Value from 0 to 1, when header is maximum extended value is 0, on shrunk header value is 1
    final double progressToShrink = shrinkOffset / _distanceToShrink;

    // Multiplier how much faster will animation finish from extended header to shrunk
    const double progressSpeed = 2;

    // Because of progressSpeed, the animation will finish faster in case of 2 will finish half way of header collapse
    if (progressSpeed * shrinkOffset < _distanceToShrink) {
      return 1 - progressSpeed * progressToShrink;
    } else {
      return 0;
    }
  }
}
