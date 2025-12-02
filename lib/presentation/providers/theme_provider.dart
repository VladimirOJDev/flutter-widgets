
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false);

//Listado de color inmutable

final colorListProvider = Provider((ref)=>colorList);

//Color seleccionable
final selectedColorIndexProvider = StateProvider<int>((ref) => 0);

//Obgeto de tipo AppTheme
final themeNotifierProvider =  StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

//Controller o notifier
class ThemeNotifier extends StateNotifier<AppTheme>{

  //State = estado del AppTheme, gracias a esto tenemos una referencia del state  de tipo AppTheme
  ThemeNotifier():super(AppTheme()); //Se crea una instancia de nuestro AppTheme que esta en app_theme

  void toggleDarkMode(){
    state = state.copyWith(isDarkMode: !state.isDarkMode);  //el nuevo estado sera una copia del estado actual, pero con el darkmode modificado
  }

  void changeColorIndex(int colorIndex){
    state = state.copyWith(selectColor: colorIndex);
  }

}