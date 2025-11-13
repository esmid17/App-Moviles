import 'package:flutter/material.dart';
import 'package:formulario/controller/arbol_controller.dart';
import 'package:formulario/view/atoms/app_textfield.dart';

class FormularioCalculo extends StatefulWidget {
  const FormularioCalculo({Key? key}) : super(key: key);

  @override
  _FormularioCalculoState createState() => _FormularioCalculoState();
}

class _FormularioCalculoState extends State<FormularioCalculo> {
  final _paltosController = TextEditingController();
  final _limonesController = TextEditingController();
  final _chirimoyosController = TextEditingController();

  final _arbolController = ArbolController();
  String? _errorText;

  void _onCalcular() {
    setState(() {
      _errorText = null; // Limpiar error previo
    });

    // Validaciones de UI
    final int? cantPaltos = int.tryParse(_paltosController.text);
    final int? cantLimones = int.tryParse(_limonesController.text);
    final int? cantChirimoyos = int.tryParse(_chirimoyosController.text);

    if (cantPaltos == null || cantLimones == null || cantChirimoyos == null) {
      setState(() {
        _errorText = "Error: Ingrese todas las cantidades.";
      });
      return;
    }

    if (cantPaltos < 0 || cantLimones < 0 || cantChirimoyos < 0) {
      setState(() {
        _errorText = "Error: Las cantidades no pueden ser negativas.";
      });
      return;
    }

    try {
      // Llamada al Controlador
      final resultado = _arbolController.calcular(
        cantPaltos: cantPaltos,
        cantLimones: cantLimones,
        cantChirimoyos: cantChirimoyos,
      );

      // (a) Aplicar rutas con parámetros
      Navigator.pushNamed(
        context,
        '/resultado',
        arguments: resultado, // Pasamos el objeto Modelo como argumento
      );
    } catch (e) {
      setState(() {
        _errorText = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextField(
            controller: _paltosController,
            label: "Cantidad de Paltos",
          ),
          const SizedBox(height: 16),
          AppTextField(
            controller: _limonesController,
            label: "Cantidad de Limones",
          ),
          const SizedBox(height: 16),
          AppTextField(
            controller: _chirimoyosController,
            label: "Cantidad de Chirimoyos",
          ),
          const SizedBox(height: 24),
          if (_errorText != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                _errorText!,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error, // (c) Tema
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          // Átomo: AppButton
          ElevatedButton(
            onPressed: _onCalcular,
            // El estilo se toma de elevatedButtonTheme en app_theme.dart
            child: const Text("Calcular Total"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _paltosController.dispose();
    _limonesController.dispose();
    _chirimoyosController.dispose();
    super.dispose();
  }
}