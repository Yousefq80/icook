import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

import '../pages/all_recipes_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: CupertinoPageScaffold(
        child: Column(
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
      ),
      backgroundColor: Colors.white,
      nextScreen: AllRecipesScreen(), // context.go("/list")
      splashIconSize: 250,
      duration: 2500,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
      animationDuration: Duration(milliseconds: 2000),
    );
  }
}
