import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo( this.title,  this.caption,  this.imageUrl);

}

final slides = <SlideInfo>[
  SlideInfo("Buscar comida", "Ad tempor veniam reprehenderit cillum dolore dolor veniam qui.", "assets/images/1.png"),
  SlideInfo("Entrega rapida", "Ullamco mollit laboris Lorem aute.", "assets/images/2.png"),
  SlideInfo("Disfrutala comida", "Mollit veniam proident elit deserunt ea.", "assets/images/3.png"),
];




class TutorialScreen extends StatefulWidget {

  static const name = 'tutorial_screen';
  const TutorialScreen({super.key});


  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {

  late final PageController pageViewController= PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener((){

      final page = pageViewController.page??0;
      if(!endReached && page >=(slides.length-1.5)){
        setState(() {
          endReached = true;
        });
      }
      
    });
  }

  //Casi obligatorio, limpia los listener
  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children: [
          PageView(//ista de widgets hijos desplazable horizontalmente o verticalmente(vistas completas)
            controller:pageViewController ,
            physics: BouncingScrollPhysics(),
            children: slides.map(
              (slideData) =>_Slide(
                title: slideData.title,
                caption: slideData.caption,
                imageUrl: slideData.imageUrl
              )
            ).toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: ()=>context.pop(),
               child: Text("Skip")
            )
          ),

          endReached? 
            Positioned(
              bottom: 30,
              right: 30,
              child: FadeInRight(
                from: 15,
                delay: Duration(seconds: 1),
                child: FilledButton(
                  onPressed: ()=>context.pop(),
                  child: Text("Comenzar")
                ),
              ),
            )
            :const SizedBox(),


        ],
      ),

    );
  }
}

class _Slide extends StatelessWidget {

  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;



    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            SizedBox(height: 20),
            Text(title,style: titleStyle,),
            SizedBox(height: 20),
            Text(caption, style: captionStyle,)
          ],
        ),
      ),
    );
  }
}