
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



class AppTheme {

  final  int selectColor;

  AppTheme({
    this.selectColor = 0
  }):assert(selectColor>=0, 'Debe ser un nuemro positivo');

  ThemeData getTheme()=>ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectColor],
    appBarTheme: AppBarTheme(
      centerTitle: true,
    )

  );
}