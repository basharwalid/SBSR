import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sbsr/Core/Base/BaseViewModel.dart';
import 'package:sbsr/Presentation/UI/HomeScreen/HomeView.dart';
import 'package:sbsr/domain/usecase/log_in_usecase.dart';
import '../../../../Core/network/userDao.dart';
import 'LoginNavigator.dart';

class LoginViewModel extends BaseViewModel<LoginNavigator> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  late final LoginUsecase loginUsecase;

  Future<void> Login(BuildContext context) async {
    try {
      var result = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passController.text);

      var user = await UsersDao.getUser(result.user!.uid);
      print("helloooooooooooooo");
      Navigator.pushReplacementNamed(context, HomeView.routeName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
