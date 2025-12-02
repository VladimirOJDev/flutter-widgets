import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget { // ConsumerWidget Nos da el ref
  static const name = "theme_changer_screen";
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Changer"),
        
        actions: [
          IconButton(
            onPressed: (){
              // ref.read(isDarkModeProvider.notifier).update(
              //   (state)=> !state
              // );
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();

            },
            icon:isDarkMode? Icon(Icons.dark_mode_outlined):Icon(Icons.light_mode_outlined)
          )
        ],
        
      ),
      body:_ThemeChangerView() ,
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {

    final List<Color> colors = ref.watch(colorListProvider); //Lista de colores
    final int selectedIndex = ref.watch(themeNotifierProvider).selectColor; //Index actual seleccionado
  
    return RadioGroup(
          
          groupValue: selectedIndex, //indice int 
          onChanged: (value) { //El value (en este caso indice de la lista) es el value del widget que este seleccionado en ese momento
            if (value != null){
              ref.read(themeNotifierProvider.notifier).changeColorIndex(value);
            }
          },

          //Construye RadioListTile segun la longitud de la lista que le pasemos, cada index sera el valor de cada widget
          child:ListView.builder(
            itemCount: colors.length,//longitud de widgets que tendra el listado
            itemBuilder: (context, index){ //contexto, index segun la posicion de la longitud maxima
              final Color color = colors[index]; //color segun el indice actual

              return RadioListTile( 
                title: Text("Este color", style: TextStyle( color: color),),
                subtitle: Text("${color.hashCode}"),
                activeColor: color,
                value:index, //valor que tendrá cada radio button renderizado
                
              );
            },
          )
        );
  }
}