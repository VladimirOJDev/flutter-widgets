import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScroolScreen extends StatefulWidget {

  static const name = 'infinite_screen';
  const InfiniteScroolScreen({super.key});

  @override
  State<InfiniteScroolScreen> createState() => _InfiniteScroolScreenState();
}

class _InfiniteScroolScreenState extends State<InfiniteScroolScreen> {

  List<int> imagesIds = [1,2,3,4,5];
  final ScrollController scrollController = ScrollController(); //controlador del scrolll del ListView
  bool isLoading = false;
  bool isMounted = true;

  //Funcion que verifica si estamos llegando al final de las imagenes y carga otrass 5
  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      //scrollController.position.pixels  // psocicion actual 
      //scrollController.position.maxScrollExtent; // Posicion final
      if((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent){ //verifica si se esta acercando a la posicion final en pixeles
        //Load Next Page
        loadNextPage();
      }
      

    });

  }

  @override
  void dispose() {
    scrollController.dispose();//limpia el dispose
    isMounted = true;
    super.dispose();
  }
  
  Future loadNextPage() async {
    if(isLoading)return;

    isLoading = true;
    setState(() {
      
    });

    await Future.delayed(Duration(seconds: 2));
    addFiveImages();
    isLoading = false;

    //TODO revisar si esta montado el componente / widget
    if(!isMounted)return;

    setState(() {});

    moveScrollBottom();

  }

//Cuando esta cerda del final hace una animacion de scroll hacia abajo para que el ususario vea que hay mas fotso
  void moveScrollBottom(){
    //Se ejecuta si esta cerca del final 
    if(scrollController.position.pixels +150 <= scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      scrollController.position.pixels +120, //Si quisieramos moverlo hasta arriba de nuevo es 0 en evz de scrollController.position.pixels +120
      duration: Duration(milliseconds: 300), 
      curve:Curves.fastOutSlowIn
    );
  }

  //Agrega 5 nuevos ids a la lista 
  void addFiveImages(){
    final lastId = imagesIds.last;

    imagesIds.addAll( //suma otros 5 ids (6,7,8,9,10) y asi sucesivametne
        [1,2,3,4,5].map((e) => lastId+e,)
    );

  }

  //Rewfresca el view y guarda el ultimo id para cargar diferentes images
  Future<void> onRefresh() async{
    isLoading = true;
    setState(() {});

    await Future.delayed(Duration(seconds: 3));
    if(!isMounted) return;

    isLoading = false;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId+1);
    addFiveImages();

    setState(() { });

  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding( //Widget que controla los paddings extras de la pantalla 

        context: context,
        removeTop: true, // remueve el espacio de la parte de la barra de notificaciones, la esconde
        removeBottom: true, //remueve el espacio de la barrita de gestos

        child: RefreshIndicator(//Sale un icono de refhresh cuando subimos hasta arriba y hacemos el gesto de refrescar
          edgeOffset: 10, // lugar donde aparece el widget de refresh 
          strokeWidth: 2, //tamaño  del widget 
          onRefresh: onRefresh, 
          child: ListView.builder( // Lista dinamica
            controller: scrollController,
            itemCount: imagesIds.length, //Cuantas imagenes a mostrar
            itemBuilder: (context, index) {
              
              return FadeInImage( //animacion de carga, fadein animation e imagen de la web
                fit: BoxFit.cover, //toma el tamaño del contenedor
                width: double.infinity, //toma tddo el espacio disponible
                height: 300,
                placeholder:AssetImage('assets/images/jar-loading.gif') , //Animacion de carga, es un gift
                 image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300'),
              );
            },
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        
        //child: Icon(Icons.arrow_back)
        child:isLoading? SpinPerfect( //Animacion de spin al widget
        infinite: true, //no deja de girar
          child: Icon(Icons.refresh_rounded)
        ):FadeIn(child: Icon(Icons.arrow_back))
      ),

    );
  }
}