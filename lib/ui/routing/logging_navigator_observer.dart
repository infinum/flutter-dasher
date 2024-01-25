import 'package:flutter/cupertino.dart';
import 'package:loggy/loggy.dart';

class LoggingNavigatorObserver extends NavigatorObserver with _NavigationLoggy {
  @override
  void didPush(Route route, Route? previousRoute) {
    loggy.debug(route.settings.name);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    loggy.debug(previousRoute?.settings.name);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    loggy.debug(newRoute?.settings.name);
  }
}

mixin _NavigationLoggy implements LoggyType {
  @override
  Loggy<LoggyType> get loggy => Loggy<_NavigationLoggy>('Navigation:');
}
