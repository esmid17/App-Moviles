import 'package:flutter/material.dart';
import 'scheme_color.dart';

class TemaAppBar {
  static const AppBarTheme estilo = AppBarTheme(
    backgroundColor: ColorApp.primario,
    foregroundColor: ColorApp.textClaro,
    centerTitle: true,
    elevation: 3,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: ColorApp.textClaro
    ),
  );
}