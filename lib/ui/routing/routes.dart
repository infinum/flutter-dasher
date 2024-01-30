import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dasher/authentication/authentication_manager.dart';
import 'package:flutter_dasher/ui/dashboard/dashboard_screen.dart';
import 'package:flutter_dasher/ui/login/login_screen.dart';
import 'package:flutter_dasher/ui/new_tweet/new_tweet_screen.dart';
import 'package:flutter_dasher/ui/profile/profile_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'routes.g.dart';

@TypedGoRoute<DashboardScreenRoute>(
  path: '/',
  routes: [
    TypedGoRoute<NewTweetScreenRoute>(
      path: 'newTweet',
    ),
    TypedGoRoute<ProfileScreenRoute>(
      path: 'profile',
    ),
  ],
)
class DashboardScreenRoute extends GoRouteData {
  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    final authentication = ProviderScope.containerOf(context).read(authenticationManagerProvider);
    if (authentication case AuthenticationUnauthenticated()) {
      return LoginScreenRoute().location;
    }
    return null;
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DashboardScreen();
  }
}

class NewTweetScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NewTweetScreen();
  }
}

class ProfileScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProfileScreen();
  }
}

@TypedGoRoute<LoginScreenRoute>(
  path: '/login',
)
class LoginScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginScreen();
  }
}
