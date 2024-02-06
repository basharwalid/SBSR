import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbsr/Core/Providers/ThemeProvider.dart';
import 'package:sbsr/Core/Theme/Theme.dart';
import 'package:sbsr/Presentation/UI/GetStarted/IntroView.dart';
import 'package:sbsr/Presentation/UI/HomeScreen/HomeView.dart';
import 'package:sbsr/Presentation/UI/Splash/Splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Presentation/UI/Registration/ForgetPassword/forgetpassword_view.dart';
import 'Presentation/UI/Registration/LogIn/login_view.dart';
import 'Presentation/UI/Registration/SignUp/signup_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => ThemeProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  late ThemeProvider themeProvider;
  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);
    setTheme();
    return MaterialApp(
      initialRoute: Splash.routeName,
      debugShowCheckedModeBanner: false,
      routes: {
        Splash.routeName: (_) => Splash(),
        IntroView.routeName: (_) => IntroView(),
        HomeView.routeName: (_) => HomeView(),
        LoginScreen.routeName: (_) => LoginScreen(),
        SignUpScreen.routeName: (_) => SignUpScreen(),
        ForgetPasswordScreen.routeName: (_) => ForgetPasswordScreen()
      },
      theme: MyTheme.greenTheme,
      darkTheme: MyTheme.purpleTheme,
      themeMode: themeProvider.getTheme(),
    );
  }

  Future<void> setTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var theme = preferences.getString("theme");
    themeProvider.changeTheme(
        theme == "Dark" || theme == null ? ThemeMode.dark : ThemeMode.light);
  }
}
