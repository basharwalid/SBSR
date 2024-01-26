import 'package:flutter/material.dart';
import 'package:sbsr/Core/Theme/Theme.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:sbsr/UI/GetStarted/IntroView.dart';

class Splash extends StatelessWidget {
  static const String routeName = "splash";

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      splash: Image.asset(
        "Assets/image/logo.png",
        width: MediaQuery.of(context).size.width ,
      ),
      nextScreen: IntroView(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: MyTheme.darkPurple,
    );
  }
}
