import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {

  static const name = 'progress_screen';
  const ProgressScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Progress Indicators"),
      ),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView( 
    
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 30,),
          Text("Circular progress indicator"),
          SizedBox(height: 30,),
          CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.black12,),
          const SizedBox(height: 20,),

          Text("Progress indicator controlado"),
          _ControlledProgressIndicator()
        ],
      ),
    );
  }
}


//Circulo de progreso controlado
class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(//se construye en tiempo de ejecucion, o sea mientras la app esta en uso
                          //Es un wudget que nos proporciona algun flujode datos en tiempo dejecucion, no es necesario para controlar el progrees indicator

      stream: Stream.periodic(Duration(milliseconds: 300), (value){ //con el stream emitimos valores frecunentemente
        return(value*2)/100; //decimales 0.0 .0 etc
      }).takeWhile((value)=> value<=100),//condicion de emision del valor

      builder: (context, snapshot) {

        final progressValue = snapshot.data??0; //si el value es null se emite un 0

        return Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
        
              //El value va de 0.0-1.0 donde 0 es el 0% y 1 es el 100%
              CircularProgressIndicator(value: progressValue,backgroundColor: Colors.black12,),
              SizedBox(width: 20,),
              Expanded( //Toma todo el espacio disponible horixzontal del padre
                child: LinearProgressIndicator(value: progressValue,)
              )
            ],
          ),
        );
      }
    );
  }
}