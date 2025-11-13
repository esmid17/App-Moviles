import 'package:flutter/material.dart';
import 'scheme_color.dart';

class TemaBotones {
  static final botonPrincipal = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ColorApp.primario,
      foregroundColor: ColorApp.textClaro,
      padding: EdgeInsets.symmetric(
        horizontal: 30, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
    ),
  );

  static final botonSecundario = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      //backgroundColor: ColorApp.secundario,
      foregroundColor: ColorApp.primario,
      padding: EdgeInsets.symmetric(
          horizontal: 28, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
      side: BorderSide(color: ColorApp.primario)
    ),
  );

}