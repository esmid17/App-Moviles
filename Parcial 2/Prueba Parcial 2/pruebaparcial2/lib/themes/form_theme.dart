import 'package:flutter/material.dart';
import 'scheme_color.dart';

class TemaFormulario {
  static final campoTexto = InputDecorationTheme(
   filled: true,
   fillColor: Colors.white24,
   labelStyle: TextStyle(
     color: Colors.black12
   ),
    prefixIconColor: ColorApp.primario,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: ColorApp.primario, width: 2),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.green),
    ),
  );
}