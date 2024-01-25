import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbsr/Core/Providers/ThemeProvider.dart';
import 'package:sbsr/Core/Theme/Theme.dart';
import 'package:sbsr/UI/HomeScreen/HomeView.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  runApp(
  ChangeNotifierProvider(create: (BuildContext context) => ThemeProvider(),
  child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  late ThemeProvider themeProvider;
  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);
    setTheme();
    return MaterialApp(
        initialRoute: HomeView.routeName,
        debugShowCheckedModeBanner: false,
        routes: {
          HomeView.routeName : (_) => HomeView(),
        },
      theme: MyTheme.greenTheme,
      darkTheme: MyTheme.purpleTheme,
      themeMode: themeProvider.getTheme(),
    );
  }

  Future<void>setTheme() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var theme = preferences.getString("theme");
    themeProvider.changeTheme(theme == "Dark" || theme == null? ThemeMode.dark : ThemeMode.light);
  }
}

