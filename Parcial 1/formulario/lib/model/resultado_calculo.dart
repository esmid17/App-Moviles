class ResultadoCalculo {
  final double subtotalBase;
  final double montoDescAdicional;
  final double subtotalConDescuento;
  final double montoIVA;
  final double totalAPagar;

  ResultadoCalculo({
    required this.subtotalBase,
    required this.montoDescAdicional,
    required this.subtotalConDescuento,
    required this.montoIVA,
    required this.totalAPagar,
  });
}