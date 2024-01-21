import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sbsr/Modules/GetStarted/get_started.dart';

class Splash extends StatelessWidget {
  static const String routeName = "splash";

  @override
  Widget build(BuildContext context) {
    var mediaQ = MediaQuery.of(context).size;
    Timer(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder:(context)=>const GetStarted()));
    });
    return Scaffold(
      backgroundColor: const Color(0xff016132A),
      body: Center(
        child: Image.asset(
          "Assets/IMG/logo-no-background 1.png",
          width: mediaQ.width * 0.6,
        ),
      ),
    );
  }
}
