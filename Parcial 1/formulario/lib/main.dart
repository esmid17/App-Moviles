import 'package:flutter/material.dart';
import 'package:formulario/model/resultado_calculo.dart';
import 'package:formulario/view/pages/calculadora_page.dart';
import 'package:formulario/view/pages/resultado_page.dart';
import 'package:formulario/themes/general_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vivero App',

      theme: TemaGeneral.claro,

      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => const CalculadoraPage());
          case '/resultado':
            if (settings.arguments is ResultadoCalculo) {
              return MaterialPageRoute(
                builder: (_) => const ResultadoPage(),
                settings: settings,
              );
            }
            return MaterialPageRoute(builder: (_) => const CalculadoraPage());
          default:
            return MaterialPageRoute(builder: (_) => const CalculadoraPage());
        }
      },
      debugShowCheckedModeBanner: false,
    );
  }
}