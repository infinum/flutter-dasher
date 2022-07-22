import 'package:get_it/get_it.dart';

import '../../device/di/inject_dependencies.dart' as device;
import '../../domain/di/inject_dependencies.dart' as domain;
import '../../source_local/di/inject_dependencies.dart' as source_local;
import '../../source_remote/di/inject_dependencies.dart' as source_remote;

void injectDependencies() {
  final getIt = GetIt.instance;

  device.injectDependencies(getIt);
  domain.injectDependencies(getIt);
  source_local.injectDependencies(getIt);
  source_remote.injectDependencies(getIt);
}
