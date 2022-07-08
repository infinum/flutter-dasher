import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dasher/ui/common/buttons/primary_text_button.dart';
import 'package:flutter_dasher/ui/common/buttons/primary_variant_button.dart';
import 'package:flutter_dasher/ui/common/look/widget/look.dart';
import 'package:flutter_dasher/ui/dashboard/provider/current_user_provider.dart';
import 'package:flutter_dasher/ui/new_tweet/provider/new_tweet_provider.dart';
import 'package:flutter_dasher/ui/new_tweet/provider/new_tweet_request_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewTweetScreen extends ConsumerWidget {
  const NewTweetScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<dynamic>(
      builder: (BuildContext context) {
        return const NewTweetScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _provider = ref.watch(newTweetProvider);
    final _newTweetProvider = ref.watch(newTweetRequestProvider);
    final imageUrl = ref.watch(currentUserProvider).imageUrl;

    ref.listen<NewTweetRequestProvider>(newTweetRequestProvider, (_, provider) {
      provider.state.whenOrNull(
        success: (_) {
          Future.delayed(const Duration(milliseconds: 800), () {
            Navigator.of(context).pop();
          });
        },
      );
    });

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PrimaryTextButton(
                        child: const Text('Cancel'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      _newTweetProvider.state.maybeWhen(
                        orElse: () => PrimaryVariantButton(
                          child: const Text('Tweet'),
                          onPressed: () => _newTweetProvider.postNewTweet(),
                        ),
                        success: (_) => Icon(
                          Icons.check,
                          size: 30,
                          color: Look.of(context).color.primary,
                        ),
                        failure: (_) => Icon(
                          Icons.error_outline,
                          size: 30,
                          color: Look.of(context).color.error,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 14, top: 5),
                        child: _buildProfilePicture(imageUrl),
                      ),
                      Flexible(
                        child: TextFormField(
                          maxLines: null,
                          textInputAction: TextInputAction.go,
                          style: Look.of(context).typography.caption,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "What's happening?",
                            hintStyle: Look.of(context).typography.caption.copyWith(color: Look.of(context).color.symbolGray),
                          ),
                          onChanged: _provider.onNewTweetChanged,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePicture(String? imageUrl) {
    if (imageUrl != null) {
      return CircleAvatar(
        radius: 18.0,
        backgroundImage: CachedNetworkImageProvider(imageUrl),
        backgroundColor: Colors.white,
      );
    } else {
      return const CircleAvatar(
        radius: 18.0,
        backgroundColor: Colors.grey,
      );
    }
  }
}
