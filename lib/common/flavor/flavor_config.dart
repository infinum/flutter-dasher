import 'package:flutter_dasher/common/flavor/flavor.dart';
import 'package:flutter_dasher/common/flavor/flavor_values.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flavor_config.g.dart';

@riverpod
FlavorConfig flavorConfig(FlavorConfigRef ref) {
  throw UnimplementedError();
}

class FlavorConfig {
  const FlavorConfig({
    required this.flavor,
    required this.values,
    required this.name,
  });

  final Flavor flavor;

  /// Flavor name formatted to show as text
  final String name;

  /// Possible flavor values that can change from flavor to flavor
  final FlavorValues values;

  /// Submit error can be called from any part of the app, if sentry is set up
  /// that error will be sent to sentry as well
  static Future<void> submitError(dynamic error, {StackTrace? stackTrace}) async {
    // Report to crashlytics
  }

  static Future<void> log(String message) async {
    // Log to crashlytics
  }
}
