import 'package:flutter/material.dart';
import 'package:flutter_dasher/gen/assets.gen.dart';
import 'package:flutter_dasher/ui/common/look/widget/look.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DasherBottomNavigationBar extends StatelessWidget {
  const DasherBottomNavigationBar({
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
