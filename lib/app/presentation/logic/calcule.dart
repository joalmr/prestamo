import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalculeLogic extends ChangeNotifier {
  num resCuota = 0;
  num resPagoTotal = 0;
  num resInteresTotal = 0;
  num resValorPrestamo = 0;
//
  String strCuota = "";
  String strPagoTotal = "";
  String strInteresTotal = "";
  String strValorPrestamo = "";

  //
  double periodo = 6;
  num interes = 0;
  num inicial = 0;
  num valor = 0;

  void valPeriodo(double value) {
    periodo = value;
    notifyListeners();
  }

  void calculos() {
    num monto = valor - inicial;
    num tem = (interes / 100) / 12;
    num formA = monto * (tem * pow((1 + tem), periodo));
    num formB = pow((1 + tem), periodo) - 1;

    //cuota
    resCuota = interes == 0 ? monto / periodo : formA / formB;
    //pago total
    resPagoTotal = resCuota * (periodo);
    //interes total
    resInteresTotal = resPagoTotal - (valor - inicial);
    //valor prestamo
    resValorPrestamo = valor - inicial;

    strCuota = convertMil(resCuota);
    strPagoTotal = convertMil(resPagoTotal);
    strInteresTotal = convertMil(resInteresTotal);
    strValorPrestamo = convertMil(resValorPrestamo);
    notifyListeners();
  }

  String convertMil(num numero) {
    NumberFormat f = new NumberFormat("#,##0.00", "en_US");
    String dato = f.format(numero);

    return dato;
  }
}
