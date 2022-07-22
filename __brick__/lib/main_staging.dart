import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app/run_{{project_name}}_app.dart';
import 'common/flavor/flavor.dart';
import 'common/flavor/flavor_config.dart';
import 'common/flavor/flavor_values.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.I.registerSingleton(FlavorConfig(
    flavor: Flavor.staging,
    name: 'Staging',
    values: const FlavorValues(
      baseUrl: 'staging URL',
    ),
  ));

  run{{project_name.pascalCase()}}App();
}
