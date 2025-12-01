import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget { //consumer widget para usar con riverpod
  static const name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) { 

    final int counterValue = ref.watch(counterProvider); //cada que counter provider cambia, flutter redibuja el widget
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Screen"),
        actions: [
          IconButton(
            onPressed: (){
              ref.read(isDarkModeProvider.notifier).update((state)=>!state); //otra forma de acxtualizar el valor
            },
            icon:isDarkMode? Icon(Icons.dark_mode_outlined):Icon(Icons.light_mode_outlined)
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          ref.read(counterProvider.notifier).state++;
        },
        child: Icon(Icons.add),
      ),

      body: Center(
        child: Text("Valor $counterValue", style: Theme.of(context).textTheme.titleLarge)
      )

    );
  }
}

