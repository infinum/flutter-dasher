import 'package:flutter/material.dart';
import 'package:flutter_dasher/ui/common/look/widget/look.dart';

class DasherTextField extends StatelessWidget {
  const DasherTextField({
    Key? key,
    this.label,
    this.textInputAction,
    this.obscureText = false,
    this.onChanged,
  }) : super(key: key);

  final String? label;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              label!,
              textAlign: TextAlign.left,
              style: Look.of(context).typography.label,
            ),
          ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          autocorrect: false,
          textInputAction: textInputAction,
          obscureText: obscureText,
          decoration: InputDecoration(
            filled: true,
            border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(16)),
            fillColor: Look.of(context).color.gray,
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            isDense: true,
          ),
        ),
      ],
    );
  }
}
