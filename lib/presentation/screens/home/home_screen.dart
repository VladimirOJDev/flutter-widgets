import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';


class HomeScreen extends StatelessWidget {

  static const name = 'home_screen'; //nombre que podemos poner en las rutas, lo llamamos dentro del go router

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>(); //referncia del estado del scaffold

    return Scaffold(
      key: scaffoldKey, //el key es una referencia de este componente para manipular su estado desde otro lugar
      appBar: AppBar(
        title: Text("Widgets + Material 3", textAlign: TextAlign.center,),
        
      ),
      body: _HomeView(),
      //drawer, end drawe, menu lateral de hamburguesa retraible
      drawer: SideMenu(scaffoldKey: scaffoldKey,),
    );
  }
}

class _HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //Lista scrolleable vertical
    return ListView.builder(
      physics: BouncingScrollPhysics(), //Fisica de rebote  scroll por ejemplo rebote
      padding: EdgeInsets.all(12), //Padding a toda la lista
      itemCount: appMenuItem.length,
      itemBuilder:(context,index){
        final menuItem = appMenuItem[index];

        
        return _CustomListTitle(menuItem: menuItem);
      }
    );

  }
}

//Tarjeta de navegacion

class _CustomListTitle extends StatelessWidget {
  const _CustomListTitle({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme; //Estilos que definimos en el mateerial app en theme

    //El componente ListTitle es un widget que formatea automaticamente
    // el titile y subtitel y otras propieddades

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary,), //widget que va al inicio antes del titulo y subt
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary,),//widget que va al final pero en la misma linea que el title
      title: Text(menuItem.titile),
      subtitle: Text(menuItem.subTutle), 
      onTap: (){
        
        // Navigator.of(context).push(
        //   MaterialPageRoute<void>(
        //     builder: (context) => const ButtonsScreen(),
        //   ),
        // );

       // Navigator.pushNamed(context, menuItem.link);

       context.push(menuItem.link); //Navegacion por ruta
      // context.pushNamed(CardsScreen.name);//Navegacion por nombre
      },
    );
  }
} 