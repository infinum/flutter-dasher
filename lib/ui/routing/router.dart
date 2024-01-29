import 'package:flutter/cupertino.dart';
import 'package:flutter_dasher/ui/routing/logging_navigator_observer.dart';
import 'package:flutter_dasher/ui/routing/routes.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/',
  routes: $appRoutes,
  observers: [
    LoggingNavigatorObserver(),
  ],
);
