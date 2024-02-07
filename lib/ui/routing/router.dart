import 'package:flutter_dasher/ui/routing/routes.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: $appRoutes,
);
