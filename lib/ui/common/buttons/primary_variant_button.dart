import 'package:flutter/material.dart';
import 'package:flutter_dasher/ui/common/look/widget/look.dart';

class PrimaryVariantButton extends StatelessWidget {
  const PrimaryVariantButton({
    Key? key,
    this.onPressed,
    this.elevation = 0,
    required this.child,
  }) : super(key: key);

  final double elevation;
  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(elevation),
          foregroundColor: MaterialStateProperty.all(Look.of(context).color.onPrimary),
          backgroundColor: MaterialStateProperty.all(Look.of(context).color.secondary),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          )),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          ),
          textStyle: MaterialStateProperty.all(Look.of(context).typography.lightButton)),
      onPressed: onPressed,
      child: child,
    );
  }
}
