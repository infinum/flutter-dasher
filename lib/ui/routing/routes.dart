import 'package:flutter/material.dart';
import 'package:flutter_dasher/ui/dashboard/dashboard_screen.dart';
import 'package:flutter_dasher/ui/login/login_screen.dart';
import 'package:flutter_dasher/ui/new_tweet/new_tweet_screen.dart';
import 'package:flutter_dasher/ui/profile/profile_screen.dart';
import 'package:go_router/go_router.dart';

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
