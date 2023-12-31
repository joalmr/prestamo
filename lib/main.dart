import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:prestamo/app/presentation/logic/calcule.dart';
import 'package:prestamo/app/presentation/views/home/home.dart';
import 'package:prestamo/src/styles/colors/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  MobileAds.instance.initialize();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final calculeLogic = CalculeLogic();
  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      calculeLogic: calculeLogic,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Préstamo',
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          scaffoldBackgroundColor: fondoColorPet,
          textSelectionTheme:
              TextSelectionThemeData(cursorColor: primarioColor),
          colorSchemeSeed: primarioColor,
        ),
        home: HomeView(),
      ),
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  final CalculeLogic calculeLogic;
  MyInheritedWidget({
    required this.calculeLogic,
    required super.child,
  });

  static MyInheritedWidget? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
