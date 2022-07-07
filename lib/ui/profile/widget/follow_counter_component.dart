import 'package:flutter/material.dart';
import 'package:flutter_dasher/ui/common/look/widget/look.dart';

class FollowCounter extends StatelessWidget {
  const FollowCounter({
    Key? key,
    required this.counter,
    required this.text,
  }) : super(key: key);

  final String counter;
  final String text;

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
