import 'app/run_dasher_app.dart';
import 'common/flavor/flavor.dart';
import 'common/flavor/flavor_config.dart';
import 'common/flavor/flavor_values.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.staging,
    name: 'Staging',
    values: const FlavorValues(
      baseUrl: 'staging URL',
      clientId: 'Uk1pRElPZnd0TlBQSDFIY2VjUUM6MTpjaQ',
      clientSecret: 'DCxJ_zS2VNXIwmyfSBNUJBzeprYLgIiNYCIkixWdpt1W7s3qd2',
      redirectUri: 'org.example.android.oauth://callback/',
      customUriScheme: 'org.example.android.oauth',
    ),
  );

  runDasherApp();
}
