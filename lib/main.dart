import 'package:flutter/material.dart';
import 'package:sbsr/Modules/GetStarted/get_started.dart';
import 'package:sbsr/Modules/Splash/Splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Splash.routeName,
      routes: {
        Splash.routeName: (context) => Splash(),
        GetStarted.routeName: (context) => GetStarted(),


      },
    );
  }
}
