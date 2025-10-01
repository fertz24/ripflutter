import 'package:flutter/material.dart';
import 'package:flutterprueba/presentation/screens/counter/counter_functions_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //para quitar el debug la banderita de la esquina
      theme: ThemeData( //tema
        useMaterial3: true,
        colorSchemeSeed: Colors.blue //esquema de color, es azul
      ),
      home: const CounterFunctionsScreen() //en el performance de flutter se recomienda const para los widget, 
      //estado inmutable, constante, widgets que no pueden cambiar sus valores
      //estado mutable, azul con amarillo hace verde, dos valores hacen otro resultado
    );
  }
}