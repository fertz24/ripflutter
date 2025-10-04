import 'package:flutter/material.dart';

class Contador extends StatefulWidget{
  const Contador({super.key});
  //el super.key se pasa al padre (StatefulWidget) para ayudar a Flutter a identificar este widget

  @override
  State<Contador> createState() => _ContadorState();
  //regresa un instancia de la variable privada, donde guarda y maneja el estado del contador
}

//mantenemos aparte el estado del contador, uno donde aumenta, disminuye y se reinicia 
//logica de negocio
class _ContadorState extends State<Contador> {
  int clickContador = 0; //iniciamos en cero

  //para reiniciar 
  //hacemos uso de la función de flecha porque es de una sola expresión
  void reiniciarContador() => setState(() => clickContador = 0);

  void disminuirContador() { //acción para disminuir 
  setState(() {
    if(clickContador > 0) { //condicional para que si es igual a 0 entonces que deje de disminuir (que no muestrue números negativos)
      clickContador--;
    }
  });
 }

 //para aumentar el contador 
 void aumentarContador() => setState(() => clickContador++);

//diseño de la pantalla del celular
 @override
 Widget build(BuildContext context) { 
  return Scaffold( //plantilla predeterminda 
    appBar: AppBar(
      title: const Text('Función de contador Fer:p', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), //header
      actions: [
        IconButton( //icono superior derecho de reiniciar 
          icon: const Icon(Icons.refresh_rounded),

          //cero inicial de la pantalla
          onPressed:() => setState(() => clickContador = 0), //onPressed espera a la función que se ejecutará cuando se presiona el botón
          //entonces cuando se presione se pone el estado el cual no más hace una acción, que es poner el contador a 0
      ),
    ],
  ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          Text('$clickContador', style: const TextStyle(fontSize: 180, fontWeight: FontWeight.w100)), //tamaño del cero inicial de la pantalla 
          Text('Click${clickContador == 1 ? '' : 's'}', style: const TextStyle(fontSize: 25)), //if ternario
        ],
      ),
    ),
    floatingActionButton: Column( //pone en columna los floatingActionButton
      mainAxisAlignment: MainAxisAlignment.end, //lo mandamos al final de la pantalla
      children: [ //arreglo de botones 
        BotonCount(icono: Icons.refresh_rounded, accion: reiniciarContador), //ejecutamos la funcion de reiniciar asi como se muestra el icono
        const SizedBox(height: 10), //espacio entre botones 
        BotonCount(icono: Icons.exposure_minus_1_outlined, accion: disminuirContador), //ejecutamos la funcion de disminuir el contador así como el ícono
        const SizedBox(height: 10), //espacio entre botones 
        BotonCount(icono: Icons.plus_one, accion: aumentarContador), //ejecutamos la función de aumentar el contrador ""
      ],
    ),
  );
 }
}

//clase para los botones 
class BotonCount extends StatelessWidget {
  final IconData icono;
  final VoidCallback? accion; //se ejecutará cuando el botón este presionado
  //el void ese es una funcion sin retorno

  const BotonCount({super.key, required this.icono, this.accion}); //parámetro por nombre
  //const quiere decir que el widget es constante y no va a cambiar internamente
  //BotonCount es el constructor de la clase (instancia del widget)
  //super.key se para al widget padre (StatelessWidget) para que Flutter pueda identificar dicho Widget
  //this.icono es obligatorio al crear el botón y se guardará en la variable icono dentro de la clase
  //this.accion es opcional y se guarda en accion, esta función es cuando el botón se presiona (onPressed)

  @override //widget personalizado
  Widget build(BuildContext) { //método de construye lo que se pondrá en el celular
    return FloatingActionButton(onPressed: accion, child: Icon(icono));
    //retorna el botón (ícono) así como la acción dependiendo de lo que el usuario presionó en el celular
  }
}