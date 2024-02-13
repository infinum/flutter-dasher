import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dasher/ui/common/dasher_bottom_navigation_bar.dart';
import 'package:flutter_dasher/ui/common/dasher_new_tweet_button.dart';
import 'package:flutter_dasher/ui/common/dasher_tweets_list.dart';
import 'package:flutter_dasher/ui/common/look/widget/look.dart';
import 'package:flutter_dasher/ui/dashboard/presenter/current_user.dart';
import 'package:flutter_dasher/ui/profile/profile_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
        automaticallyImplyLeading: false,
        title: Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(right: 30.0, left: 4),
          child: const _ProfilePicture(),
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

class _ProfilePicture extends ConsumerWidget {
  const _ProfilePicture();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl = ref.watch(currentUserProvider).imageUrl;

    return GestureDetector(
      onTap: () => Navigator.of(context).push<void>(ProfileScreen.route()),
      child: CircleAvatar(
        radius: 16.0,
        backgroundImage: CachedNetworkImageProvider(imageUrl!),
        backgroundColor: Colors.white,
      ),
    );
  }
}
