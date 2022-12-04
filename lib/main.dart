import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icook/providers/category_provider.dart';
import 'package:icook/providers/recipes_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'pages/all_recipes_screen.dart';
import 'pages/new_recipe_screen.dart';

void main() {
  runApp(MyApp());
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: const AllRecipesScreen(),
      splash: Column(
        children: [
          Image.asset('assets/images/logo_icook.jpg'),
          SizedBox(
            height: 25,
          ),
          const Text(
            'iCook',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          const Text(
            '"Our slogan goes here..."',
            style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Colors.black87),
          ),
        ],
      ),
      splashIconSize: 250,
      backgroundColor: Colors.white,
      duration: 2500,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
      animationDuration: Duration(milliseconds: 2000),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => RecipesProvider()),
      ],
      child: CupertinoApp(
        title: 'iCook App',
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        routes: {
          '/': (_) => AllRecipesScreen(),
          '/new': (_) => NewRecipeScreen(),
          '/splash': (_) => SplashScreen(),
        },
      ),
    );
  }
}
