import 'package:flutter/material.dart';
import 'package:flutter_dasher/ui/common/dasher_tweet.dart';

class DasherTweetsList extends StatelessWidget {
  const DasherTweetsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
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
      ),
    );
  }
}
