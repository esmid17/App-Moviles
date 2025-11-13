import 'package:flutter/material.dart';
import 'package:formulario/model/resultado_calculo.dart';
import 'package:formulario/view/organism/tarjeta_resultado.dart';

class ResultadoPage extends StatelessWidget {
  const ResultadoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final resultado = ModalRoute.of(context)!.settings.arguments as ResultadoCalculo;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Resultado"),
      ),
      body: Center(
        child: TarjetaResultado(resultado: resultado),
      ),
    );
  }
}