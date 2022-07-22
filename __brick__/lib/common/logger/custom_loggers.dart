import 'package:loggy/loggy.dart';

mixin ProviderLogger implements LoggyType {
  @override
  Loggy<ProviderLogger> get loggy => Loggy<ProviderLogger>('Provider: $runtimeType');
}

mixin InteractorLogger implements LoggyType {
  @override
  Loggy<InteractorLogger> get loggy => Loggy<InteractorLogger>('Interactor: $runtimeType');
}

mixin RepositoryLogger implements LoggyType {
  @override
  Loggy<RepositoryLogger> get loggy => Loggy<RepositoryLogger>('Repository: $runtimeType');
}

// For session related events
mixin AuthenticationLoggy implements LoggyType {
  @override
  Loggy<AuthenticationLoggy> get loggy => Loggy<AuthenticationLoggy>('Authentication');
}

class NotificationsLoggy implements LoggyType {
  @override
  Loggy<NotificationsLoggy> get loggy => Loggy<NotificationsLoggy>('Notifications');
}

class DefaultLoggy implements LoggyType {
  @override
  Loggy<DefaultLoggy> get loggy => Loggy<DefaultLoggy>('Default');
}

class AnalyticsLoggy implements LoggyType {
  @override
  Loggy<AnalyticsLoggy> get loggy => Loggy<AnalyticsLoggy>('Analytics event');
}
