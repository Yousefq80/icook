import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icook/pages/add_category.dart';
import 'package:icook/pages/new_recipe_screen.dart';
import 'package:icook/pages/search_page.dart';
import 'package:icook/pages/signin.dart';
import 'package:icook/pages/signup_page.dart';
import 'package:icook/providers/auth_provider.dart';
import 'package:icook/providers/recipes_provider.dart';
import 'package:icook/widgets/splash_screen.dart';
import 'package:provider/provider.dart';
import 'pages/all_recipes_screen.dart';
import 'pages/new_recipe_screen.dart';

void main() async {
  // if (Platform.isAndroid) {
  //   Client.dio.options = BaseOptions(baseUrl: "http://127.0.0.1:8000");
  // }

  WidgetsFlutterBinding.ensureInitialized();
  var authProvider = AuthProvider();
  var isAuth = await authProvider.hasToken();

  print("isAuth $isAuth");

  runApp(MyApp(
    authProvider: authProvider,
  ));
}

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSplashScreen(
//       nextScreen: const AllRecipesScreen(),
//       splash: Column(
//         children: [
//           Image.asset('assets/images/logo_icook.jpg'),
//           SizedBox(
//             height: 25,
//           ),
//           const Text(
//             'iCook',
//             style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87),
//           ),
//           const Text(
//             '"Our slogan goes here..."',
//             style: TextStyle(
//                 fontSize: 20,
//                 fontStyle: FontStyle.italic,
//                 color: Colors.black87),
//           ),
//         ],
//       ),
//       splashIconSize: 250,
//       backgroundColor: Colors.white,
//       duration: 2500,
//       splashTransition: SplashTransition.fadeTransition,
//       pageTransitionType: PageTransitionType.bottomToTop,
//       animationDuration: Duration(milliseconds: 2000),
//     );
//   }
// }

final router = GoRouter(
  initialLocation: "/list",
  routes: [
    GoRoute(
      path: '/signup',
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      path: '/signin',
      builder: (context, state) => SignInPage(),
    ),
    GoRoute(
      path: '/splash',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/list',
      builder: (context, state) => AllRecipesScreen(),
    ),
    GoRoute(
      path: '/add',
      builder: (context, state) => NewRecipeScreen(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => SearchPage(),
    ),
    GoRoute(
      path: '/category',
      builder: (context, state) => addCategory(),
    ),
    // GoRoute(
    //   path: '/edit',
    //   builder: (context, state) => EditRecipeScreen(
    //     pet: state.extra as Recipe,
    //   ),
    // ),
  ],
);

class MyApp extends StatelessWidget {
  final AuthProvider authProvider;
  MyApp({
    required this.authProvider,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RecipesProvider()),
        ChangeNotifierProvider(create: (context) => authProvider),
      ],
      child: CupertinoApp.router(
        title: 'iCook App',
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        color: Color.fromARGB(255, 187, 35, 24),
      ),
    );

    // MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (context) => CategoryProvider()),
    //     ChangeNotifierProvider(create: (context) => RecipesProvider()),
    //   ],
    //   child: CupertinoApp(
    //     title: 'iCook App',
    //     debugShowCheckedModeBanner: false,
    //     initialRoute: '/splash',
    //     routes: {
    //       '/': (_) => AllRecipesScreen(),
    //       '/new': (_) => NewRecipeScreen(),
    //       '/splash': (_) => SplashScreen(),
    //     },
    //   ),
    // );
  }
}
