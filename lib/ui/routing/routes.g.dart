// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $dashboardScreenRoute,
      $loginScreenRoute,
    ];

RouteBase get $dashboardScreenRoute => GoRouteData.$route(
      path: '/',
      factory: $DashboardScreenRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'newTweet',
          factory: $NewTweetScreenRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'profile',
          factory: $ProfileScreenRouteExtension._fromState,
        ),
      ],
    );

extension $DashboardScreenRouteExtension on DashboardScreenRoute {
  static DashboardScreenRoute _fromState(GoRouterState state) =>
      DashboardScreenRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $NewTweetScreenRouteExtension on NewTweetScreenRoute {
  static NewTweetScreenRoute _fromState(GoRouterState state) =>
      NewTweetScreenRoute();

  String get location => GoRouteData.$location(
        '/newTweet',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProfileScreenRouteExtension on ProfileScreenRoute {
  static ProfileScreenRoute _fromState(GoRouterState state) =>
      ProfileScreenRoute();

  String get location => GoRouteData.$location(
        '/profile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginScreenRoute => GoRouteData.$route(
      path: '/login',
      factory: $LoginScreenRouteExtension._fromState,
    );

extension $LoginScreenRouteExtension on LoginScreenRoute {
  static LoginScreenRoute _fromState(GoRouterState state) => LoginScreenRoute();

  String get location => GoRouteData.$location(
        '/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
