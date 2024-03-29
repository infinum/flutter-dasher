import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dasher/gen/assets.gen.dart';
import 'package:flutter_dasher/ui/common/look/widget/look.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DasherTweet extends StatelessWidget {
  const DasherTweet({
    Key? key,
    required this.avatarURL,
    required this.name,
    required this.usernameTag,
    required this.createdAt,
    required this.tweetText,
    required this.commentsCount,
    required this.retweetsCount,
    required this.likesCount,
  }) : super(key: key);

  final String? avatarURL;
  final String? name;
  final String? usernameTag;
  final String? createdAt;
  final String tweetText;
  final String commentsCount;
  final String retweetsCount;
  final String likesCount;

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
          if (avatarURL != null)
            CircleAvatar(
              radius: 27,
              backgroundImage: CachedNetworkImageProvider(avatarURL!),
              backgroundColor: Colors.white,
            ),
          if (avatarURL == null)
            const CircleAvatar(
              radius: 27,
              backgroundColor: Colors.grey,
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
                        name!,
                        style: Look.of(context).typography.tweetBold.copyWith(color: Look.of(context).color.onBackground),
                      ),
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            '$usernameTag · $createdAt',
                            style: Look.of(context).typography.tweetBody.copyWith(color: Look.of(context).color.symbolGray),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      tweetText,
                      style: Look.of(context).typography.tweetBody.copyWith(color: Look.of(context).color.onBackground),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _IconText(
                          icon: SvgPicture.asset(Assets.svg.tweetComment.path),
                          text: commentsCount,
                        ),
                        _IconText(
                          icon: SvgPicture.asset(Assets.svg.tweetRetweet.path),
                          text: retweetsCount,
                        ),
                        _IconText(
                          icon: SvgPicture.asset(Assets.svg.tweetLike.path),
                          text: likesCount,
                        ),
                        _IconText(
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

class _IconText extends StatelessWidget {
  const _IconText({
    Key? key,
    required this.icon,
    this.text,
  }) : super(key: key);

  final SvgPicture icon;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
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
