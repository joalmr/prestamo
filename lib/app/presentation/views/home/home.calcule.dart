import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prestamo/app/presentation/views/ads.dart';
import 'package:prestamo/app/presentation/views/home/widgets/titulo_calcule.dart';
import 'package:prestamo/app/presentation/views/result/result.dart';
import 'package:prestamo/app/presentation/widgets/button/primary.button.dart';
import 'package:prestamo/app/presentation/widgets/textformfield/input.widget.dart';
import 'package:prestamo/main.dart';

class CalculeView extends StatefulWidget {
  const CalculeView({super.key});

  @override
  State<CalculeView> createState() => _CalculeViewState();
}

class _CalculeViewState extends State<CalculeView> {
  TextEditingController valorCtr = TextEditingController();
  TextEditingController interesCtr = TextEditingController();

  final money = TextInputMask(
    mask: '9+,999,999.99',
    placeholder: '',
    maxPlaceHolders: 3,
    reverse: true,
    maxLength: 14,
  );
  final interes = TextInputMask(
    mask: '9+.99',
    placeholder: '',
    maxPlaceHolders: 3,
    reverse: true,
    maxLength: 5,
  );

  @override
  Widget build(BuildContext context) {
    final calculeLogic = MyInheritedWidget.of(context)!.calculeLogic;
    return AdsView(
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              height: double.maxFinite,
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    TituloCalcule(),
                    SizedBox(height: 20),
                    SizedBox(height: 20),
                    TextFormInput(
                      labelText: "Valor del préstamo",
                      controller: valorCtr,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        money,
                        LengthLimitingTextInputFormatter(14),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 18),
                      child: GestureDetector(
                        child: TextFormInput(
                          labelText: "Tasa de interés anual",
                          controller: interesCtr,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            interes,
                            LengthLimitingTextInputFormatter(5)
                          ],
                          suffix: Container(
                            child: Text(
                              "%",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 18, right: 4),
                      child: AnimatedBuilder(
                        animation: calculeLogic,
                        builder: (BuildContext context, Widget? child) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Text(
                                  "Periodo en meses: ${calculeLogic.periodo.toStringAsFixed(0)}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(height: 8),
                              Slider(
                                value: calculeLogic.periodo,
                                max: 60,
                                divisions: 60,
                                label: calculeLogic.periodo.toStringAsFixed(0),
                                onChanged: (value) {
                                  calculeLogic.valPeriodo(value);
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 12,
              bottom: 24,
              top: 18,
            ),
            child: ButtonPrimary(
              text: "Calcular",
              onPressed: () async {
                if (valorCtr.text.isEmpty || interesCtr.text.isEmpty) {
                  const snackBar = SnackBar(
                    backgroundColor: Color(0xFFbf3a2b),
                    content: Text('Ingrese todos los campos'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  String val1 = valorCtr.text.replaceAll(',', '');

                  calculeLogic.valor = double.parse(val1);
                  calculeLogic.interes = num.parse(interesCtr.text);

                  calculeLogic.calculos();

                  Navigator.of(context).push(
                    new MaterialPageRoute(
                      builder: (_) => ResultView(),
                    ),
                  );
                  // }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
