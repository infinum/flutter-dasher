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
      clientId: 'Uk1pRElPZnd0TlBQSDFIY2VjUUM6MTpjaQ',
      clientSecret: 'DCxJ_zS2VNXIwmyfSBNUJBzeprYLgIiNYCIkixWdpt1W7s3qd2',
      redirectUri: 'org.example.android.oauth://callback/',
      customUriScheme: 'org.example.android.oauth',
    ),
  );

  runDasherApp();
  FlutterNativeSplash.remove();
}
