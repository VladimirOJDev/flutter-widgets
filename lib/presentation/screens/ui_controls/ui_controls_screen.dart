import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'uiControls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ui controlls")),
      body: _UiControlsView(),
    );
  }
}

//Enumeracion del radio list
enum Transportation { car, boat, submarine, bike }

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

class _UiControlsViewState extends State<_UiControlsView> {

  //valor del SwitchListTile
  bool isDeveloper = true;

  //valor del RadioGroup
  Transportation seectedTransportation = Transportation.car; // var de tipo transportation del enum
  
  //Valores del CheckboxListTile
  bool wantsBreackFast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;



  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(), //fisicas del listado por ejemplo rebote
      children: [
        //Boton switcheable,on-off junto con un listado, una card con title y sub
        SwitchListTile(
          title: Text("Developer mode"),
          subtitle: Text("Controles adicionales"),
          value: isDeveloper, //Valor del switch
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),

        //Widget que toma todo el ancho y sirve para expandir o contraer widgets hijos
        ExpansionTile(
          title: Text("Vehículo de transporte"),
          subtitle: Text("$seectedTransportation"),
          children: [
            //Conjunto de switches que solo se puede selecionar una ala vez-perfecto para encuenstas
            RadioGroup(
              groupValue: seectedTransportation,
              onChanged: (value) {
                setState(() {
                  seectedTransportation = value ?? Transportation.car;
                });
              },
              child: Column(
                children: [
                  //Opcion del carro , widwet de flutter para opcion de radius
                  RadioListTile(
                    value: Transportation.car,
                    title: Text("Carro"),
                    subtitle: Text("Viajar por carro"),
                  ),

                  //Opcion del submarino
                  RadioListTile(
                    value: Transportation.submarine,
                    title: Text("Submarino"),
                    subtitle: Text("Viajar por submarino"),
                  ),

                  //Opcion del bote
                  RadioListTile(
                    value: Transportation.boat,
                    title: Text("Bote"),
                    subtitle: Text("Viajar por bote"),
                  ),

                  //Opcion del moto
                  RadioListTile(
                    value: Transportation.bike,
                    title: Text("Moto"),
                    subtitle: Text("Viajar por moto"),
                  ),
                ],
              ),
            ),
          ],
        ),
      
        CheckboxListTile(
          title:Text("Incluir desayuno"),
          value: wantsBreackFast, 
          onChanged: (value)=>setState(() {
            wantsBreackFast = !wantsBreackFast;
          }),
        ),
        CheckboxListTile(
          title:Text("Incluir Almuerzo"),
          value: wantsLunch, 
          onChanged: (value)=>setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title:Text("Incluir cena"),
          value: wantsDinner, 
          onChanged: (value)=>setState(() {
            wantsDinner = !wantsDinner;
          }),
        )

      ],
    );
  }
}
