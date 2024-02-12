import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sbsr/Core/Base/BaseViewModel.dart';
import 'package:sbsr/Presentation/UI/Registration/LogIn/login_view.dart';
import 'package:sbsr/Presentation/UI/Registration/SignUp/signupNavigator.dart';

import '../../../../Core/network/userDao.dart';
import '../../../../data/model/userModel.dart';

class SignUpViewModel extends BaseViewModel<SignUpNavigator> {
  TextEditingController emailController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPassController = TextEditingController();

  Future<void> creatAccount(BuildContext context) async {
    try {
      var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      await UsersDao.createUser(UserModel(
          name: nameController.text,
          email: emailController.text,
          phone: phoneController.text,
          password: passwordController.text,
          id: result.user!.uid));
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
