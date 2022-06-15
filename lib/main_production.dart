import 'package:flutter/material.dart';

import 'app/run_dasher_app.dart';
import 'common/flavor/flavor.dart';
import 'common/flavor/flavor_config.dart';
import 'common/flavor/flavor_values.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FlavorConfig(
    flavor: Flavor.production,
    name: 'Production',
    values: const FlavorValues(
      baseUrl: 'production URL',
    ),
  );

  runDasherApp();
}
