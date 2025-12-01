
import 'package:flutter/material.dart';

//Tipo de variabeles del menu

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

//Listado de widgets que se mostraran en el hoe y sus rutas correspondientes, se usa en el router
List<MenuItem> appMenuItem = [
  MenuItem(
    titile: "Contador",
    subTutle: "Contador y estado en riverpod",
    link: "/counter",
    icon: Icons.add
  ),
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
  ),
    MenuItem(
    titile: "Progress Indicators",
    subTutle: "Generales y controlados",
    link: "/progress",
    icon: Icons.refresh_rounded
  ),
  MenuItem(
    titile: "SnackaBars y diálogos",
    subTutle: "Indicadores en pantalla",
    link: "/snackbars",
    icon: Icons.inbox_outlined
  ),
    MenuItem(
    titile: "Animated container",
    subTutle: "Statefull widget animado",
    link: "/animated",
    icon: Icons.check_box_outlined
  ),
  MenuItem(
    titile: "Ui controls + Tiles",
    subTutle: "Serie de controles de flutter",
    link: "/ui-controls",
    icon: Icons.check_box_outlined
  ),
  MenuItem(
    titile: "Introduccion  a la aplicacion",
    subTutle: "Tutorial introductorio",
    link: "/tutorial",
    icon: Icons.accessibility_new_rounded
  ),
  MenuItem(
    titile: "InfiniteScroll y Pull",
    subTutle: "Listas infinitas y  pull to refresh",
    link: "/infitineScroll",
    icon: Icons.refresh_outlined
  ),

  
]; 