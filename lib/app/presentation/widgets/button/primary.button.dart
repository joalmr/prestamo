import 'package:flutter/material.dart';

import 'style.button.dart';

class ButtonPrimary extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;
  final IconData? icon;

  const ButtonPrimary({
    this.onPressed,
    required this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 46,
      margin: EdgeInsets.symmetric(vertical: 2),
      child: TextButton(
        child: Text(text!),
        onPressed: onPressed,
        style: buttonStylePrimary,
      ),
    );
  }
}
