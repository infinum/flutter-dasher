import 'package:flutter_dasher/authentication/authentication_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart';

part 'twitter_api.g.dart';

@Riverpod(keepAlive: true)
TwitterApi twitterApi(TwitterApiRef ref) {
  final authentication = ref.watch(authenticationManagerProvider);

  return switch (authentication) {
    AuthenticationUnauthenticated() => throw Exception('Needs to be authenticated'),
    AuthenticationAuthenticated(:final accessToken) => TwitterApi(bearerToken: accessToken),
  };
}
