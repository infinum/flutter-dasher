import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app/run_dasher_app.dart';
import 'common/flavor/flavor.dart';
import 'common/flavor/flavor_config.dart';
import 'common/flavor/flavor_values.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  WidgetsFlutterBinding.ensureInitialized();

  FlavorConfig(
    flavor: Flavor.production,
    name: 'Production',
    values: const FlavorValues(
      baseUrl: 'production URL',
    ),
  );

  runDasherApp();
  FlutterNativeSplash.remove();
}
