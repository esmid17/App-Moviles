import 'package:flutter/material.dart';
import 'package:formulario/model/resultado_calculo.dart';
import 'package:formulario/view/organism/tarjeta_resultado.dart';

class ResultadoPage extends StatelessWidget {
  const ResultadoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // (a) Recibir el parámetro de la ruta
    final resultado = ModalRoute.of(context)!.settings.arguments as ResultadoCalculo;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Resultado del Cálculo"),
        // El back button es automático
      ),
      body: Center(
        child: TarjetaResultado(resultado: resultado),
      ),
    );
  }
}