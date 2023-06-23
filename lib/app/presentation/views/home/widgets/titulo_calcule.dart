import 'package:flutter/material.dart';

class TituloCalcule extends StatelessWidget {
  const TituloCalcule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Calcula",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 48,
          ),
        ),
        Text(
          "tu préstamo",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 48,
          ),
        ),
      ],
    );
  }
}
