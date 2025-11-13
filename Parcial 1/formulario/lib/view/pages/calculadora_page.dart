import 'package:flutter/material.dart';
import 'package:formulario/view/organism/formulario_calculo.dart';

class CalculadoraPage extends StatelessWidget {
  const CalculadoraPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora Vivero"),
      ),
      body: SingleChildScrollView(
        child: FormularioCalculo(),
      ),
    );
  }
}