import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';
import 'package:loggy/loggy.dart';

import '../../common/error_handling/base/localized_exception.dart';
import '../flavor/flavor_config.dart';

/// This kind of logging will help in two ways:
///
/// Exception is raised in interactor/repository, let's say unexpected JSON
/// and our parsing breaks, the request_provider would catch that exception
/// and show it to the user. Although this might be bug in our code and app
/// will not work, this kind of error will not be registered on crashlytics
/// since it's caught and handled. FirebaseLogPrinter would submit that
/// error to Crashlytics.
/// [Loggy for Crashlytics](https://github.com/infinum/flutter-bits/tree/master/loggy_crashlytics)

class FirebaseLogPrinter extends LoggyPrinter {
  const FirebaseLogPrinter();

  @override
  void onLog(LogRecord record) {
    if (record.object is LocalizedException) {
      print('Not logging expected exception.');
      return; // Don't log expected exceptions as they are considered normal user flow
    }

    if (record.level.priority >= LogLevel.error.priority) {
      if (record.object is Error) {
        FlavorConfig.submitError(record.object, stackTrace: (record.object as Error).stackTrace);
      } else {
        FlavorConfig.submitError(record.object);
      }
    } else {
      final time = record.time.toIso8601String().split('T')[1];
      final callerFrame = record.callerFrame == null ? '-' : '(${record.callerFrame?.location})';
      FlavorConfig.log('$time $callerFrame ${record.message}');
    }
  }
}

/// This works in tandem with above printer, it's filters unnecessary data that we don't need to log
class ReleaseLogFilter extends LoggyFilter {
  @override
  bool shouldLog(LogLevel level, Type type) {
    if (type == DioLoggy) {
      // Don't log network traffic, it's huge amount of data and potentially sensitive
      return false;
    }

    return true;
  }
}
