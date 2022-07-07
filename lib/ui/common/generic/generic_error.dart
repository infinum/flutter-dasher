import 'package:flutter/material.dart';

import '../look/widget/look.dart';

/// Shows generic error widget, with possibility to add retry button below it
/// if [onRetry] is not null retry will be active
///
/// [message] should be readable error message that will be shown to the user
class GenericError extends StatelessWidget {
  const GenericError(this.message, {this.onRetry, Key? key}) : super(key: key);

  factory GenericError.exception(Exception exception, BuildContext context, {VoidCallback? onRetry, Key? key}) {
    return GenericError('Unknown error', onRetry: onRetry, key: key);
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
                  backgroundColor: Look.of(context).color.error.withOpacity(0.1),
                  child: Icon(
                    Icons.error_outline,
                    color: Look.of(context).color.error,
                  ),
                ),
                const SizedBox(width: 12),
                Text(message, textAlign: TextAlign.center, style: Look.of(context).typography.body),
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
      child: const Text('Retry'),
    );
  }
}
