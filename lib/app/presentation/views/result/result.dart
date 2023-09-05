import 'package:flutter/material.dart';
import 'package:prestamo/app/presentation/views/ads.dart';
import 'package:prestamo/app/presentation/views/result/result.graphic.dart';
import 'package:prestamo/app/presentation/views/result/result.resume.dart';
import 'package:prestamo/config/styles/colors/colors.dart';

class ResultView extends StatefulWidget {
  ResultView({super.key});

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  num segmentoCuota = 0;

  @override
  Widget build(BuildContext context) {
    return AdsView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(top: 20, left: 32, right: 32),
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    segmentoCuota = 0;
                  }),
                  child: Container(
                    height: double.maxFinite,
                    margin: EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: segmentoCuota == 0 ? primarioColor : null,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Center(
                      child: Text(
                        "Resumen",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    segmentoCuota = 2;
                  }),
                  child: Container(
                    height: double.maxFinite,
                    margin: EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: segmentoCuota == 2 ? primarioColor : null,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Center(
                      child: Text(
                        "Gráfico",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: segmentoCuota == 0 ? ResumenView() : GraphicView(),
          ),
        ],
      ),
    );
  }
}
