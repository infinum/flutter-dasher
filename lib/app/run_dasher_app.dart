import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

import '../common/app_build_mode.dart';
import '../common/flavor/flavor_config.dart';
import 'dasher_app.dart';

// ignore_for_file: prefer-match-file-name
Future<void> runDasherApp() async {
  await runZonedGuarded<Future<void>>(() async {
    final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    final appBuildMode = _determineAppBuildMode();
    Loggy.initLoggy(logPrinter: PrettyPrinter());

    // pre-startup initialization
    _setupErrorCapture(appBuildMode);
    _lockOrientation();
    // final locale = await _getSavedLocale();

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    runApp(
      ProviderScope(
        child: const DasherApp(),
      ),
    );
    FlutterNativeSplash.remove();
  }, (dynamic error, StackTrace stackTrace) async {
    await FlavorConfig.submitError(
      error,
      stackTrace: stackTrace,
    );
  });
}

void _setupErrorCapture(AppBuildMode appBuildMode) {
  FlutterError.onError = (FlutterErrorDetails details) async {
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
