import 'package:flutter/material.dart';

import 'style.button.dart';

class ButtonIcon extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;
  final Color color;

  const ButtonIcon({
    this.onPressed,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 46,
      margin: EdgeInsets.symmetric(vertical: 2),
      child: TextButton(
        child: Icon(icon),
        onPressed: onPressed,
        style: buttonStyleIcon(color),
      ),
    );
  }
}
