import 'package:flutter/material.dart';
import 'package:flutter_dasher/gen/assets.gen.dart';
import 'package:flutter_dasher/ui/common/dasher_tweets_list.dart';
import 'package:flutter_dasher/ui/common/look/widget/look.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends HookWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 30.0),
              child: GestureDetector(
                onTap: () => print('Profile clicked'),
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
      floatingActionButton: const _DasherNewTweetButton(),
      bottomNavigationBar: const _DasherBottomNavigationBar(),
    );
  }
}

class _DasherNewTweetButton extends StatelessWidget {
  const _DasherNewTweetButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        print('New tweet clicked');
      },
      backgroundColor: Look.of(context).color.secondary,
      child: SvgPicture.asset(Assets.svg.buttonNewTweet.path),
    );
  }
}

class _DasherBottomNavigationBar extends StatelessWidget {
  const _DasherBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Look.of(context).color.border,
            width: 0.5,
          ),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Look.of(context).color.background,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.svg.navigationHome.path),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.svg.navigationSearch.path),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.svg.navigationBell.path),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.svg.navigationMail.path),
            label: 'Inbox',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.red,
        onTap: null,
      ),
    );
  }
}
