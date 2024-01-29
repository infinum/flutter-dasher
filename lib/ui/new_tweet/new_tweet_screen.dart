import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dasher/twitter/user_tweets_notifier.dart';
import 'package:flutter_dasher/ui/common/buttons/primary_text_button.dart';
import 'package:flutter_dasher/ui/common/buttons/primary_variant_button.dart';
import 'package:flutter_dasher/ui/common/look/widget/look.dart';
import 'package:flutter_dasher/user/user_notifier.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewTweetScreen extends HookConsumerWidget {
  const NewTweetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl = ref.watch(userNotifierProvider).value!.imageUrl;

    final postNewTweet = ref.watch(userTweetsNotifierProvider.postNewTweet);
    ref.listen(userTweetsNotifierProvider.postNewTweet, (_, next) {
      if (next case PostNewTweetMutationSuccess()) {
        GoRouter.of(context).pop();
      } else if (next case PostNewTweetMutationFailure()) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Something went wrong')));
      }
    });

    final tweetTextController = useTextEditingController();

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
                        onPressed: () => GoRouter.of(context).pop(),
                      ),
                      switch (postNewTweet) {
                        PostNewTweetMutationLoading() => const CircularProgressIndicator(),
                        _ => PrimaryVariantButton(
                            child: const Text('Tweet'),
                            onPressed: () => postNewTweet(tweetTextController.text),
                          )
                      },
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
                          controller: tweetTextController,
                          maxLines: null,
                          textInputAction: TextInputAction.go,
                          style: Look.of(context).typography.caption,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "What's happening?",
                            hintStyle:
                                Look.of(context).typography.caption.copyWith(color: Look.of(context).color.symbolGray),
                          ),
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
