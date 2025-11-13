import 'package:formulario/model/resultado_calculo.dart';

class ArbolController {
  static const _precioPalto = 1200.0;
  static const _precioLimon = 1000.0;
  static const _precioChiri = 980.0;

  static const _descPalto1 = 0.10;
  static const _descPalto2 = 0.18;
  static const _descLimon1 = 0.125;
  static const _descLimon2 = 0.20;
  static const _descChiri1 = 0.145;
  static const _descChiri2 = 0.19;

  static const _descAdicional = 0.15;
  static const _tasaIva = 0.19;

  ResultadoCalculo calcular({
    required int cantPaltos,
    required int cantLimones,
    required int cantChirimoyos,
  }) {
    if (cantPaltos < 0 || cantLimones < 0 || cantChirimoyos < 0) {
      throw Exception("Las cantidades no pueden ser negativas.");
    }

    double netoPaltos = _calcularNeto(cantPaltos, _precioPalto, _descPalto1, _descPalto2);
    double netoLimones = _calcularNeto(cantLimones, _precioLimon, _descLimon1, _descLimon2);
    double netoChirimoyos = _calcularNeto(cantChirimoyos, _precioChiri, _descChiri1, _descChiri2);

    double subtotalBase = netoPaltos + netoLimones + netoChirimoyos;
    int cantidadTotal = cantPaltos + cantLimones + cantChirimoyos;

    double montoDescAdicional = 0.0;
    double subtotalConDescuento;

    if (cantidadTotal > 1000) {
      montoDescAdicional = subtotalBase * _descAdicional;
      subtotalConDescuento = subtotalBase - montoDescAdicional;
    } else {
      subtotalConDescuento = subtotalBase;
    }

    double montoIVA = subtotalConDescuento * _tasaIva;
    double totalAPagar = subtotalConDescuento + montoIVA;

    return ResultadoCalculo(
      subtotalBase: subtotalBase,
      montoDescAdicional: montoDescAdicional,
      subtotalConDescuento: subtotalConDescuento,
      montoIVA: montoIVA,
      totalAPagar: totalAPagar,
    );
  }

  // Helper privado para calcular el descuento por tipo
  double _calcularNeto(int cantidad, double precio, double desc1, double desc2) {
    double subtotal = cantidad * precio;
    if (cantidad > 300) {
      return subtotal * (1 - desc2);
    } else if (cantidad > 100) {
      return subtotal * (1 - desc1);
    } else {
      return subtotal;
    }
  }
}