import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';




// GoRouter configuration, configuracion de todas las rutas existentes
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    //Definiciones de las rutas para cada screen
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => HomeScreen(),
    ),

    GoRoute(
      path: '/buttons',
      name:ButtonsScreen.name ,
      builder: (context, state) => ButtonsScreen(),
    ),

    GoRoute(
      path: '/cards',
      name: CardsScreen.name,
      builder: (context, state) => CardsScreen(),
    ),
      GoRoute(
      path: '/progress',
      name: ProgressScreen.name,
      builder: (context, state) => ProgressScreen(),
    ),
  ],
);