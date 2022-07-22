import 'package:flutter/widgets.dart';

import 'base/localized_exception.dart';

/// Formats the exception to user readable message
class ErrorFormatter {
  ErrorFormatter._();

  static String format(Exception exception, {required BuildContext context}) {
    if (exception is LocalizedException) {
      return exception.toLocalizedMessage(context);
    } else {
      return 'Unexpected error';
    }
  }
}
