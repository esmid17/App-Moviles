import 'package:flutter/material.dart';
import 'themes/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prueba de Tema',
      debugShowCheckedModeBanner: false,

      theme: TemaGeneral.claro,

      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: FondoApp.degradoPrincipal,

      child: Scaffold(

        backgroundColor: Colors.transparent,

        appBar: AppBar(
          title: const Text('Prueba de Tema'),
          elevation: 0,
        ),

        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Text(
                  'Estilo de Título',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: ColorApp.textClaro // Color blanco de tu tema
                  ),
                ),
                Text(
                  'Un subtítulo o cuerpo de texto.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: ColorApp.textClaro // Color blanco de tu tema
                  ),
                ),
                const SizedBox(height: 30),

                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Campo de Texto',
                    hintText: 'Escribe algo...',
                    prefixIcon: Icon(Icons.edit),
                  ),
                  style: TextStyle(color: ColorApp.textClaro),
                ),
                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Botón Principal'),
                ),
                const SizedBox(height: 15),

                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      foregroundColor: ColorApp.textClaro,
                      side: const BorderSide(color: ColorApp.textClaro)
                  ),
                  child: const Text('Botón Secundario'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}