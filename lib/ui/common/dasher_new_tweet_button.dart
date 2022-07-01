import 'package:flutter/material.dart';
import 'package:flutter_dasher/gen/assets.gen.dart';
import 'package:flutter_dasher/ui/common/look/widget/look.dart';
import 'package:flutter_dasher/ui/new_tweet/new_tweet_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DasherNewTweetButton extends StatelessWidget {
  const DasherNewTweetButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.of(context).push<void>(NewTweetScreen.route()),
      backgroundColor: Look.of(context).color.secondary,
      child: SvgPicture.asset(Assets.svg.buttonNewTweet.path),
    );
  }
}
