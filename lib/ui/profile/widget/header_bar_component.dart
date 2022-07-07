import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dasher/ui/common/look/widget/look.dart';

class HeaderBar extends SliverPersistentHeaderDelegate {
  HeaderBar({
    required this.expandedHeight,
    required this.shrinkHeight,
    required this.profileName,
    required this.avatarURL,
  });

  final double expandedHeight;
  final double shrinkHeight;
  final String? profileName;
  final String? avatarURL;

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
            profileName!,
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
                  image: CachedNetworkImageProvider(avatarURL!),
                  fit: BoxFit.contain,
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
