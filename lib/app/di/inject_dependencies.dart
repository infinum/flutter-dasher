import 'package:flutter_dasher/device/di/inject_dependencies.dart' as device;
import 'package:flutter_dasher/domain/di/inject_dependencies.dart' as domain;
import 'package:flutter_dasher/source_local/di/inject_dependencies.dart'
    as source_local;
import 'package:flutter_dasher/source_remote/di/inject_dependencies.dart'
    as source_remote;
import 'package:flutter_dasher/source_dev/inject_dependencies.dart' as source_dev;
import 'package:get_it/get_it.dart';

void injectDependencies() {
  final getIt = GetIt.instance;

  device.injectDependencies(getIt);
  domain.injectDependencies(getIt);
  source_dev.injectDependencies(getIt);
  source_local.injectDependencies(getIt);
  source_remote.injectDependencies(getIt);
}
