import 'package:flutter/material.dart';
import 'package:flutter_dasher/ui/common/look/widget/look.dart';

class PrimaryTextButton extends StatelessWidget {
  const PrimaryTextButton({
    Key? key,
    this.onPressed,
    required this.child,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(Look.of(context).typography.lightButton.copyWith(color: Look.of(context).color.primary)),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(vertical: 8)),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
