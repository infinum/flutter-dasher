import 'package:flutter/material.dart';
import 'package:flutter_dasher/ui/common/look/widget/look.dart';
import 'package:flutter_dasher/ui/profile/widget/follow_counter_component.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    Key? key,
    required this.name,
    required this.usernameTag,
    this.bio,
    required this.following,
    required this.followers,
  }) : super(key: key);

  final String name;
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
            name,
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
              FollowCounter(counter: following, text: 'Following'),
              FollowCounter(counter: followers, text: 'Followers'),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
