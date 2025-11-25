import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';




// GoRouter configuration, configuracion de todas las rutas existentes
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    //Definiciones de las rutas para cada screen
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),

    GoRoute(
      path: '/buttons',
      builder: (context, state) => ButtonsScreen(),
    ),

    GoRoute(
      path: '/cards',
      builder: (context, state) => CardsScreen(),
    ),
  ],
);