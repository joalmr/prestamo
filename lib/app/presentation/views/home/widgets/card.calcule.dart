import 'package:flutter/material.dart';
import 'package:prestamo/config/styles/colors/colors.dart';

class CardCalcule extends StatelessWidget {
  final int numero;
  final bool periodo;
  const CardCalcule({super.key, required this.numero, required this.periodo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 52,
        width: 42,
        margin: EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: periodo ? primarioColor : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            numero.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
