import 'package:flutter/widgets.dart';

abstract class LocalizedException extends Exception {
  factory LocalizedException([String? message]) => LocalizedException(message);

  String toLocalizedMessage(BuildContext context);
}
