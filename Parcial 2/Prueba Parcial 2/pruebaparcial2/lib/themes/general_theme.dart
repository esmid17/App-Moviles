import 'package:flutter/material.dart';
import 'scheme_color.dart';
import 'buttons_theme.dart';
import 'typography.dart';
import 'appbar_theme.dart';
import 'form_theme.dart';
import 'background_theme.dart';

class TemaGeneral {
  static ThemeData claro = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: ColorApp.primario,
      secondary: ColorApp.secundario,
      background: ColorApp.fondo,
      onPrimary: ColorApp.textClaro,
      onSecondary: Colors.white
    ),
    textTheme: TipografiaApp.texto,
    appBarTheme: TemaAppBar.estilo,
    elevatedButtonTheme: TemaBotones.botonPrincipal,
    outlinedButtonTheme: TemaBotones.botonSecundario,
    inputDecorationTheme: TemaFormulario.campoTexto,
    scaffoldBackgroundColor: ColorApp.fondo
  );
}