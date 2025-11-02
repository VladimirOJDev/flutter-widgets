
import 'package:flutter/material.dart';

class MenuItem{
  final String titile;
  final String subTutle;
  final String link;
  final IconData icon;

  MenuItem({
    required this.titile,
    required this.subTutle,
    required this.link,
    required this.icon
  });



}

List<MenuItem> appMenuItem = [
  MenuItem(
    titile: "Botones",
    subTutle: "Varios botones en flutter",
    link: "/buttons",
    icon: Icons.smart_button_outlined
  ),
  MenuItem(
    titile: "Tarjetas",
    subTutle: "Un contenedor estilizado",
    link: "/cards",
    icon: Icons.credit_card
  )
]; 