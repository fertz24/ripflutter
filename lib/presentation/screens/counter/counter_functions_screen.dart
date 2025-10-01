import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget { //con esatdo
  const CounterFunctionsScreen({super.key});

  @override //crear un estado que 
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) { //state el que sea primero empieza con el Widget Build 
    return Scaffold( //plantilla de inicio que viene predeterminada
      appBar: AppBar( //header, encabezado
        title: const Text('Counter Functions'),
        actions: [ //
          IconButton(  //widget de un boton 
            icon: const Icon(Icons.refresh_rounded), //boton de refresh
            onPressed: () { //presionado
              setState(() {
                clickCounter = 0; //este limpia el boton, el valor del contador
              });
            })
        ],
      ),
      body: Center( //cuerpo, esta centrando
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //para centrar
          children: [ //arreglo de widget
            Text('$clickCounter', //numero, lo convierte en string
            style: const TextStyle( //esto tambien es un widget
              fontSize: 160, fontWeight: FontWeight.w100)),
              
            Text('Click${clickCounter == 1 ? '' : 's'}', // esto es un if ternario, es para poner clicks y click
            style: const TextStyle(fontSize:25))
          ],
        ),
      ),
      floatingActionButton: Column( //los botones de abajo
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            icon: Icons.refresh_rounded,
            onPressed: () {
              clickCounter = 0;
              setState(() {});
            },
          ),
          const SizedBox(height: 10), //el tamano de la caja y height para separar
          CustomButton(
            icon: Icons.exposure_minus_1_outlined,
            onPressed: () {
              if (clickCounter == 0) return;
              clickCounter--;
              setState(() {});
            },
          ),
          const SizedBox(height: 10), 
          CustomButton(
            icon: Icons.plus_one,
            onPressed: () {
              clickCounter++;
              setState(() {});
          },
        ),
      ],
    ));
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  
  const CustomButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      enableFeedback: true,
      elevation: 5,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}