import 'package:flutter/material.dart';
import 'package:formulario/model/resultado_calculo.dart';

class TarjetaResultado extends StatelessWidget {
  final ResultadoCalculo resultado;

  const TarjetaResultado({Key? key, required this.resultado}) : super(key: key);

  String _formatCurrency(double value) {
    final asString = value.round().toString();

    final regExp = RegExp(r'\B(?=(\d{3})+(?!\d))');
    final withDots = asString.replaceAll(regExp, '.');

    return '\$$withDots';
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    Widget _buildResultRow(String label, double value) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: textTheme.bodyLarge),
          Text(_formatCurrency(value), style: textTheme.bodyLarge),
        ],
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Resumen de Compra",
              style: textTheme.titleLarge, // (c) Tema
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            _buildResultRow("Subtotal Base", resultado.subtotalBase),
            const SizedBox(height: 8),
            _buildResultRow("Descuento (>1000 árboles)", resultado.montoDescAdicional),
            const SizedBox(height: 8),
            _buildResultRow("Subtotal con Descuento", resultado.subtotalConDescuento),
            const SizedBox(height: 8),
            _buildResultRow("IVA (19%)", resultado.montoIVA),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TOTAL A PAGAR:",
                  style: textTheme.headlineSmall?.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
                Text(
                  _formatCurrency(resultado.totalAPagar),
                  style: textTheme.headlineSmall?.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}