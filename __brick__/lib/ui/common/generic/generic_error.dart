import 'package:flutter/material.dart';

import '../../../common/error_handling/error_formatter.dart';
{{#brick_look}}import '../../../ui/common/look/widget/look.dart';{{/brick_look}}

/// Shows generic error widget, with possibility to add retry button below it
/// if [onRetry] is not null retry will be active
///
/// [message] should be readable error message that will be shown to the user
class GenericError extends StatelessWidget {
  const GenericError(this.message, {this.onRetry, Key? key}) : super(key: key);

  factory GenericError.exception(Exception exception, BuildContext context, {VoidCallback? onRetry, Key? key}) {
    return GenericError(ErrorFormatter.format(exception, context: context), onRetry: onRetry, key: key);
  }

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: {{#brick_look}}Look.of(context).color.error.withOpacity(0.1),{{/brick_look}}{{^brick_look}}Colors.red.withOpacity(0.1),{{/brick_look}}
                  child: Icon(
                    Icons.error_outline,
                    color: {{#brick_look}}Look.of(context).color.error,{{/brick_look}}{{^brick_look}}Colors.red{{/brick_look}}
                  ),
                ),
                const SizedBox(width: 12),
                Text(message, textAlign: TextAlign.center, {{#brick_look}}style: Look.of(context).typography.body{{/brick_look}}),
              ],
            ),
            const SizedBox(height: 16),

            /// Show retry button below the widget if [onRetry] has been provided
            if (onRetry != null) _RetryButton(onRetry!),
          ],
        ),
      ),
    );
  }
}

class _RetryButton extends StatelessWidget {
  const _RetryButton(this.onRetry, {Key? key}) : super(key: key);

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onRetry,
      child: Text('RETRY'),
    );
  }
}
