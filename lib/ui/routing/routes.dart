import 'package:flutter_dasher/ui/dashboard/dashboard_screen.dart';
import 'package:flutter_dasher/ui/login/login_screen.dart';
import 'package:flutter_dasher/ui/profile/profile_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

part 'routes.g.dart';

@TypedGoRoute<DashboardScreenRoute>(
  path: '/',
  routes: [
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