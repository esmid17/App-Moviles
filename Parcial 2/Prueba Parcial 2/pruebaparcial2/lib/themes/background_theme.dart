import 'package:flutter/material.dart';
import 'scheme_color.dart';

class FondoApp {
  static const BoxDecoration degradoPrincipal = BoxDecoration(
    gradient: LinearGradient(colors: [ColorApp.primario, ColorApp.secundario],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );

  static const BoxDecoration fondoBlanco = BoxDecoration(
    color: Colors.white,
  );

  static const BoxDecoration fondoGris = BoxDecoration(
    color: ColorApp.fondo,
  );
}