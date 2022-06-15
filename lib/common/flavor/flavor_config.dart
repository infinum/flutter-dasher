import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dasher/common/flavor/flavor.dart';
import 'package:flutter_dasher/common/flavor/flavor_values.dart';
import 'package:loggy/loggy.dart';

@immutable
class FlavorConfig {
  factory FlavorConfig({
    required Flavor flavor,
    required FlavorValues values,
    required String name,
  }) {
    _instance = FlavorConfig._internal(flavor, values, name);
    return _instance;
  }

  FlavorConfig._internal(this.flavor, this.values, this.name) {
    logDebug('Running application with flavor: $flavor');
  }

  final Flavor flavor;

  /// Flavor name formatted to show as text
  final String name;

  /// Possible flavor values that can change from flavor to flavor
  final FlavorValues values;

  /// Current instance of config
  static late FlavorConfig _instance;

  static FlavorConfig get instance => _instance;

  /// Return boolean for weather current build is production or staging
  static bool get isProduction => _instance.flavor == Flavor.production;

  static bool get isStaging => _instance.flavor == Flavor.staging;

  /// Submit error can be called from any part of the app, if sentry is set up
  /// that error will be sent to sentry as well
  static Future<void> submitError(dynamic error,
      {StackTrace? stackTrace}) async {
    // Report to crashlytics
  }

  static Future<void> log(String message) async {
    // Log to crashlytics
  }
}
