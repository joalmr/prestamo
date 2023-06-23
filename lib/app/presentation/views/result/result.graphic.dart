import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:prestamo/app/presentation/views/result/widgets/detalle_grafico.dart';
import 'package:prestamo/main.dart';
import 'package:prestamo/src/styles/colors/colors.dart';

class GraphicView extends StatelessWidget {
  const GraphicView({super.key});

  @override
  Widget build(BuildContext context) {
    final calculeLogic = MyInheritedWidget.of(context)!.calculeLogic;
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 20),
            child: PieChartSample3(
              interesTotal: calculeLogic.resInteresTotal,
              valorPrestamo: calculeLogic.resValorPrestamo,
              pagoTotal: calculeLogic.resPagoTotal,
            ),
          ),
          GraficoDetalle(
            texto: "Interés total:",
            valor: calculeLogic.strInteresTotal,
            color: primarioColor,
          ),
          GraficoDetalle(
            texto: "Valor préstamo:",
            valor: calculeLogic.strValorPrestamo,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class PieChartSample3 extends StatefulWidget {
  final num interesTotal;
  final num valorPrestamo;
  final num pagoTotal;
  PieChartSample3({
    super.key,
    required this.interesTotal,
    required this.valorPrestamo,
    required this.pagoTotal,
  });

  @override
  State<StatefulWidget> createState() => PieChartSample3State(
        interesTotal,
        valorPrestamo,
        pagoTotal,
      );
}

class PieChartSample3State extends State {
  final num interesTotal;
  final num valorPrestamo;
  final num pagoTotal;

  PieChartSample3State(
    this.interesTotal,
    this.valorPrestamo,
    this.pagoTotal,
  );

  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: AspectRatio(
        aspectRatio: 1,
        child: PieChart(
          PieChartData(
            pieTouchData: PieTouchData(
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    touchedIndex = -1;
                    return;
                  }
                  touchedIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                });
              },
            ),
            borderData: FlBorderData(show: false),
            sectionsSpace: 0,
            centerSpaceRadius: 0,
            sections: showingSections(
              interesTotal,
              valorPrestamo,
              pagoTotal,
            ),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections(
    num interesTotal,
    num valorPrestamo,
    num pagoTotal,
  ) {
    final porcInteres = interesTotal / pagoTotal;
    final procPrestamo = valorPrestamo / pagoTotal;

    print(porcInteres);
    print(procPrestamo);

    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: primarioColor,
            value: porcInteres,
            title: '${(porcInteres * 100).toStringAsFixed(0)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.white,
            value: procPrestamo,
            title: '${(procPrestamo * 100).toStringAsFixed(0)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              shadows: shadows,
            ),
          );

        default:
          throw Exception('Oh no');
      }
    });
  }
}
