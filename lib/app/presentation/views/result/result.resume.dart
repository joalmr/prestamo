import 'package:flutter/material.dart';
import 'package:prestamo/app/presentation/views/result/widgets/detalle.dart';
import 'package:prestamo/main.dart';
import 'package:prestamo/src/styles/colors/colors.dart';

class ResumenView extends StatelessWidget {
  const ResumenView({super.key});

  @override
  Widget build(BuildContext context) {
    final calculeLogic = MyInheritedWidget.of(context)!.calculeLogic;
    return Container(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Tu cuota mensual es",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            calculeLogic.strCuota,
            style: TextStyle(
              color: primarioColor,
              fontSize: 48,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "financiado en ${calculeLogic.periodo.toStringAsFixed(0)} meses",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 62),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DetalleCuota(
                  texto: "Interés total:",
                  valor: calculeLogic.strInteresTotal,
                ),
                DetalleCuota(
                  texto: "Pago total préstamo:",
                  valor: calculeLogic.strPagoTotal,
                ),
                DetalleCuota(
                  texto: "Valor préstamo:",
                  valor: calculeLogic.strValorPrestamo,
                ),
                DetalleCuota(
                  texto: "Tasa interés:",
                  valor: "${calculeLogic.interes}%",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
