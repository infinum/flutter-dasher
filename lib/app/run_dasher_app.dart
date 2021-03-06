import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dasher/ui/login/login_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app/di/inject_dependencies.dart' as app;
import '../common/app_build_mode.dart';
import '../common/flavor/flavor_config.dart';
import 'dasher_app.dart';

// ignore_for_file: prefer-match-file-name
Future<void> runDasherApp() async {
  await runZonedGuarded<Future<void>>(() async {
    // injection
    _injectAppBuildMode();
    app.injectDependencies();

    // pre-startup initialization
    _setupErrorCapture();
    _lockOrientation();
    // final locale = await _getSavedLocale();

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    runApp(
      ProviderScope(
        child: DasherApp(const LoginScreen()),
      ),
    );
  }, (dynamic error, StackTrace stackTrace) async {
    await FlavorConfig.submitError(
      error,
      stackTrace: stackTrace,
    );
  });
}

void _injectAppBuildMode() {
  final appBuildMode = _determineAppBuildMode();
  GetIt.instance.registerSingleton<AppBuildMode>(appBuildMode);
}

void _setupErrorCapture() {
  FlutterError.onError = (FlutterErrorDetails details) async {
    final appBuildMode = GetIt.instance.get<AppBuildMode>();
    if (appBuildMode == AppBuildMode.debug) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      Zone.current.handleUncaughtError(details.exception, details.stack ?? StackTrace.empty);
    }
  };
}

void _lockOrientation() {
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
}

AppBuildMode _determineAppBuildMode() {
  if (kDebugMode) {
    return AppBuildMode.debug;
  } else if (kProfileMode) {
    return AppBuildMode.profile;
  } else {
    return AppBuildMode.release;
  }
}
