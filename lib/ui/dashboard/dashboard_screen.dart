import 'package:flutter/material.dart';
import 'package:flutter_dasher/ui/common/dasher_bottom_navigation_bar.dart';
import 'package:flutter_dasher/ui/common/dasher_new_tweet_button.dart';
import 'package:flutter_dasher/ui/common/dasher_tweets_list.dart';
import 'package:flutter_dasher/ui/common/look/widget/look.dart';
import 'package:flutter_dasher/ui/profile/profile_screen.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DashboardScreen extends HookWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  static Route route() {
    return MaterialPageRoute<dynamic>(
      builder: (BuildContext context) {
        return const DashboardScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 30.0),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push<void>(ProfileScreen.route()),
                child: const CircleAvatar(
                  radius: 16.0,
                  backgroundImage: NetworkImage('https://source.unsplash.com/random/32x32?sig=1'),
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        shape: Border(
          bottom: BorderSide(
            color: Look.of(context).color.border,
            width: 0.5,
          ),
        ),
      ),
      body: const DasherTweetsList(),
      floatingActionButton: const DasherNewTweetButton(),
      bottomNavigationBar: const DasherBottomNavigationBar(),
    );
  }
}
