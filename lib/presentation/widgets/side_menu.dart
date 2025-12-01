import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex= 1; //Opcion del menu seleccionada

  @override
  Widget build(BuildContext context) {

    //Nos regresa la distancia del top en la pantalla de cualquier dispositivo si le ponemos condicion un bool
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      //selecciona el drawer
      selectedIndex: navDrawerIndex,

      //cambia dinamicamente la seleccion
      onDestinationSelected: (value){
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItem[value]; //ya tenemos la opcion seleccionada, para navegar recuperamos el link de navegacion de ese mismo item
        context.push(menuItem.link); 

        //se pone widget ya que hace referencia al statefull
        widget.scaffoldKey.currentState?.closeEndDrawer(); //cierra el drawer
      },
      children: [
        
        //Dependiendo del padding top del dispositivo habra uno u otro padding
        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(28, hasNotch?10:20, 16, 10),
          child: Text("Main"),
          
        ),

        ...appMenuItem
          .sublist(0,3)//solomuestra 3 elementos del listado 
          .map((item)=> NavigationDrawerDestination(
            icon: Icon(item.icon),
            label: Text(item.titile)
          ),
        ),

        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(28, 16, 28, 10),
          child: Divider(), //linea divisoria
        ),

        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(28, hasNotch?10:20, 16, 10),
          child: Text("Menu options"),
          
        ),
        ...appMenuItem
          .sublist(3)//solomuestra a partir de l elemento 3 
          .map((item)=> NavigationDrawerDestination(
            icon: Icon(item.icon),
            label: Text(item.titile)
          ),
        ),




      ],
    );
  }
}