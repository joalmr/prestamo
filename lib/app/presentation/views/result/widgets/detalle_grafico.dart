import 'package:flutter/material.dart';

class GraficoDetalle extends StatelessWidget {
  final String texto;
  final String valor;
  final Color? color;
  const GraficoDetalle({
    super.key,
    required this.texto,
    required this.valor,
    this.color,
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
                    color: color,
                  ),
                  SizedBox(width: 5),
                  Text(
                    texto,
                    style: TextStyle(
                      color: color,
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
                  color: color,
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
