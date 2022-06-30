import 'package:flutter/material.dart';
import 'package:flutter_dasher/gen/assets.gen.dart';
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
                onTap: () => print('image clicked'),
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
      body: TweetsList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Look.of(context).color.secondary,
        child: SvgPicture.asset(Assets.svg.buttonNewTweet.path),
      ),
      bottomNavigationBar: Container(
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
      ),
    );
  }
}

class TweetsList extends StatelessWidget {
  const TweetsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return const DasherTweet();
        },
      ),
    );
  }
}

class DasherTweet extends StatelessWidget {
  const DasherTweet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(
          color: Color(0xffCED5DC),
          width: 0.5,
        ),
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 27,
            backgroundImage: NetworkImage('https://source.unsplash.com/random/54x54?sig=1'),
            backgroundColor: Colors.white,
          ),
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Ime prezime',
                        style: Look.of(context).typography.tweetBold.copyWith(color: Look.of(context).color.onBackground),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          '@username · 30m',
                          style: Look.of(context).typography.tweetBody.copyWith(color: Look.of(context).color.symbolGray),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                      style: Look.of(context).typography.tweetBody.copyWith(color: Look.of(context).color.onBackground),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconText(
                          icon: SvgPicture.asset(Assets.svg.tweetComment.path),
                          text: '15',
                        ),
                        IconText(
                          icon: SvgPicture.asset(Assets.svg.tweetRetweet.path),
                          text: '20',
                        ),
                        IconText(
                          icon: SvgPicture.asset(Assets.svg.tweetLike.path),
                          text: '25',
                        ),
                        IconText(
                          icon: SvgPicture.asset(Assets.svg.tweetShare.path),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class IconText extends StatelessWidget {
  const IconText({
    Key? key,
    required this.icon,
    this.text,
  }) : super(key: key);

  final SvgPicture icon;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40.0),
      child: Row(
        children: [
          icon,
          if (text != null)
            Container(
              margin: const EdgeInsets.only(left: 3.0),
              child: Text(
                text!,
                style: Look.of(context).typography.symbolLabel.copyWith(color: Look.of(context).color.symbolGray),
              ),
            )
        ],
      ),
    );
  }
}
