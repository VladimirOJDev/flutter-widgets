
import 'package:flutter/material.dart';

/*
 *Este archivo se encarga de darle estilo a casi toda la app
 desde qui puedes controlar el color general, las propiedades
 del appbar etc. 
 */
const List<Color> colorList = [
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.orange,
  Colors.pink,
]; 


//clase que regresa un Apptheme
class AppTheme {

  final int selectColor;
  final bool isDarkMode;

  AppTheme({
    this.isDarkMode =false,
    this.selectColor = 0
  }):assert(selectColor>=0, 'Debe ser un nuemro positivo');

  ThemeData getTheme()=>ThemeData(
    useMaterial3: true,                                             //Usa material 3
    brightness: isDarkMode? Brightness.dark:Brightness.light,      //Modo oscuro/claro
    colorSchemeSeed: colorList[selectColor],                       //Color principal de la aplicacion
    appBarTheme: AppBarTheme(                                      //Los AppBar siempre se central
      centerTitle: true,
    )

  );
}