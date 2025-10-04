import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget { //con estado, o sea puede cambiar mientras la app está corriendo
  const CounterFunctionsScreen({super.key}); //constructor constante
  //el super.key se pasa al padre (StatefulWidget) para ayudar a Flutter a identificar este widget

  @override //crear un estado del widget
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
  //regresa un instancia de la variable privada, donde guarda y maneja el estado del contador
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) { //state el que sea primero empieza con el Widget Build,
  //build ya trae por defecto el tamaño del celular.

    return Scaffold( //plantilla de inicio que viene predeterminada
      appBar: AppBar( //header, encabezado
      //appbar es una instancia, un widget

        title: const Text('Counter Functions', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        actions: [ //
          IconButton(  //widget de un boton 
            icon: const Icon(Icons.refresh_rounded), //boton de refresh
            onPressed: () { //presionado
              setState(() {//actualiza la interfaz cuando cambia algo en el estado
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
          const SizedBox(height: 10), //el tamaño de la caja y height para separar
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

class CustomButton extends StatelessWidget { //clase que hereda el StatelessWidget (no guarda el estado) o sea no cambiara internamente mientras se usa
  final IconData icon; //icono que se muestra en el boton
  final VoidCallback? onPressed; //se ejecutará cuando el botón este presionado
  //el void ese es una funcion sin retorno
  
  //const CustomButton({ //constante (no va a cambiar)
    //super.key, //clave para el widget padre y ayuda a flutter a identificar este widget 
    //required this.icon, //obligatorio
    //this.onPressed, //opcional
  //});

   const CustomButton({super.key, required this.icon, this.onPressed,});

  @override //build es el metodo que construye el widget visualmente
  Widget build(BuildContext context) { //context es el indicador de un árbol de widgets
    return FloatingActionButton(
      enableFeedback: true, //activa vibracion o sonido al presionar (si el celular lo permite)
      elevation: 5, //sombra
      onPressed: onPressed, //se conecta con la funcion
      child: Icon(icon), //para mostrar el icono que declaramos arriba
    );
  }
}