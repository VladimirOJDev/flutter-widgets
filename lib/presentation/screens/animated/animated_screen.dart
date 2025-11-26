import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {

  static const name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double widt = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  void changeShape(){
      final random = Random();

      widt  = random.nextInt(300) + 50;
      height = random.nextInt(300) + 50;
      borderRadius = random.nextInt(100) + 10;
      color = Color.fromRGBO(
        random.nextInt(255), //RED
        random.nextInt(255), //GREEN
        random.nextInt(255), //BLUE
        1 //OPACITY 
      );

      setState(() {
        
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:changeShape,
        child: Icon(Icons.play_arrow_outlined),
      ),
      body: Center(
        child: AnimatedContainer( //Contenerdor que se anima automaticamente cuando sus propiedaes cambian
          duration: Duration(milliseconds: 400), //duracion de la animacion
          curve: Curves.easeOutCubic ,//animaciones o tipo de animacion
          width: widt <= 0 ? 0: widt, //ancho y validacion
          height: height <= 0 ? 0: height,//largo
          decoration: BoxDecoration(color: color,borderRadius: BorderRadius.circular(borderRadius <0 ? 0: borderRadius)), //estilos del contenedor
        ),
      ),
    );
  }
}