import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {

  static const name = 'snackBar_screen';
  const SnackBarScreen ({super.key});

  //Muestra un snackbar
  void showCustomSnackbar(BuildContext context){

    ScaffoldMessenger.of(context).clearSnackBars(); // Limpia los snackbars para que no se sobrepongan

    final snackbar = SnackBar( //Mnesaje y comportamiento del snackbar, es el snackbar como tal
      content: Text("Notificacion "),
      action:SnackBarAction(label: 'ok!', onPressed: (){}) ,//boton dentro del snackbar
      duration: Duration(seconds: 2), //duracion que se muestra el snackbar
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar); //Mensaje que se emite en el scafold ams cercano en este caso el snackbar
  }

  //Crea un dialog personalizado
  void openDialog(BuildContext context){
      showDialog(
        context: context, 
        barrierDismissible: false, //Permite o no, cerrar el dialogo cuando toca fuera de este
        builder: (context) => AlertDialog(
          title: Text("estas seguro?"),
          content: Text("Ex duis consequat dolor anim deserunt. Dolore tempor fugiat tempor culpa ullamco quis aliquip ullamco magna dolor qui reprehenderit ex. Ut minim Lorem ullamco cillum laboris quis ad. Consequat et reprehenderit nisi nisi fugiat cillum proident amet excepteur. Cillum minim ipsum ullamco nostrud. Ex laborum voluptate labore ex in eu elit est id aute consectetur non sit dolore. Do qui tempor dolor aliquip do non dolor."),
          actions: [
            TextButton(onPressed: ()=>context.pop(), child: Text("Cancelar")), //el context tiene acceso al router

            FilledButton(onPressed: ()=>context.pop(), child: Text("Aceptar"))
          ],
        ),
      );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("SnackBars y dialogos"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            FilledButton.tonal( //boton con tonalidad de fondo del color primario
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    Text("Ut veniam proident amet ex.")
                  ]
                ); //Muestra todas las licencias definidas en la app (pubspec.lok)
              },
              child: Text("Licencias usadas")
            ),

            FilledButton.tonal( //boton con tonalidad de fondo del color primario
              onPressed: (){
                
                openDialog(context);

              },
              child: Text("Mostrar Dialogo personalizado")
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(//El extended nos permite un boton mas grande que un cuadrado, y poner mas cosas
        label: Text("Mostrar snackbar"),
        icon: Icon(Icons.remove_red_eye_outlined),
        onPressed: ()=>showCustomSnackbar(context), 
      ),

    );
  }
}

