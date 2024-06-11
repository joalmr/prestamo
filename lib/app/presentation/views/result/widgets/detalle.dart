import 'package:flutter/material.dart';
import 'package:prestamo/config/styles/colors/colors.dart';

class DetalleCuota extends StatelessWidget {
  final String texto;
  final String valor;
  const DetalleCuota({
    super.key,
    required this.texto,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.monetization_on_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    texto,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
          Column(
            children: [
              Text(
                valor,
                style: TextStyle(
                  color: primarioColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
