import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buttons Screen"),
      ),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsetsGeometry.all(8), // o .symetric para ponerlo en vertical y horizontal
        child: Wrap( // es como un Row, pone en vertical los componentes y si ya no caben hace un salto de linea
          spacing:10 ,//Espacio entre widgets
          alignment: WrapAlignment.center, //centra los wdgets hijos
          children: [
            ElevatedButton(onPressed: (){},child: Text("Elevated")),

            const ElevatedButton(onPressed: null ,child: Text("Elevated Disable Button")), //el null deshabilita el boton
            
            ElevatedButton.icon(
              onPressed: (){}, 
              icon:Icon(Icons.access_alarm_outlined),
              label: Text("Elevated icon"),
            ),
            
            FilledButton(onPressed: (){}, child: Text("Filled")),

            FilledButton.icon(onPressed: (){},
              icon:Icon(Icons.accessibility_rounded),
              label: Text("Filled icon"),
            ),

            OutlinedButton(onPressed: (){}, child: Text("Outline")),
            OutlinedButton.icon(onPressed: (){},icon: Icon(Icons.accessible_forward_rounded), label: Text("Outline icon")),

            TextButton(onPressed: (){}, child: Text("Text button")),
            TextButton.icon(onPressed: (){},icon: Icon(Icons.account_balance_outlined), label: Text("Text icon")),
            
            IconButton(onPressed: (){}, icon: Icon(Icons.phone_rounded)), // null en onpresed para deshabilitar
            
            //Boton de icono con estilos
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.phone_rounded),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colors.primary), //color de fondo
                iconColor: WidgetStatePropertyAll(Colors.white) //color del widget
              ),
            ),

            //CustomButtom
            CustomButton()

          ],
        ),
      ),
    );
  }
}

//Boton completament personalizado
//La forma en que se hizo es ir poco a poco envolviendo en distintos widgets, desde el text hasta el ClipRReact
class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ClipRRect( //Widget que puede redondear su borde
    borderRadius: BorderRadiusGeometry.circular(20),
      child: Material(
        color: colors.primary, //color de fondo
        child: InkWell(//Detector de "estado" podemos agregar  un ontap
        onTap: (){},
          child: Padding( //padding interno
            padding: EdgeInsetsGeometry.all(12), //propiedad del padding
            child: const Text("CustomButton",style: TextStyle(color: Colors.white),)
          ),
        ),
      ),
    );
  }
}