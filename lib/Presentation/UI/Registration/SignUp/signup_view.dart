import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sbsr/Core/Base/BaseState.dart';
import 'package:sbsr/Presentation/UI/Registration/LogIn/login_view.dart';
import 'package:sbsr/Presentation/UI/Registration/SignUp/signupNavigator.dart';
import 'package:sbsr/Presentation/UI/Registration/SignUp/signupViewModel.dart';
import 'package:sbsr/domain/Entities/userEntity.dart';

import '../../../../Core/Theme/Theme.dart';
import '../custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = 'signup-view';

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends BaseState<SignUpScreen, SignUpViewModel>
    implements SignUpNavigator {
  var regex = RegExp('[a-z0-9]+@[a-z]+.[a-z]{2,3}');

  bool isvisible = false;

  bool isvisible2 = false;
  var viewmodel = SignUpViewModel();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Form(
              key: formKey,
              child: Column(
                children: [
                  Image(
                    image: const AssetImage("Assets/image/logo.png"),
                    width: mediaquery.width * 0.3,
                  ),
                  SizedBox(
                    height: mediaquery.height * 0.025,
                  ),
                  Text(
                    "Sign Up",
                    style: theme.textTheme.displayLarge!
                        .copyWith(fontSize: 35, fontWeight: FontWeight.w600),
                  ),
                  CustomFormField(
                    hint: "Enter Your Email",
                    prefixIcon: const Icon(Icons.email_outlined),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "You must enter your email address";
                      }
                      if (!regex.hasMatch(value)) {
                        return "invalid email address";
                      }
                      return null;
                    },
                    textcontroller: viewmodel.emailController,
                    keyboardtype: TextInputType.emailAddress,
                  ),
                  CustomFormField(
                    hint: "Name",
                    prefixIcon: const Icon(Icons.contact_mail_outlined),
                    textcontroller: viewmodel.nameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "You must enter your name";
                      }
                      return null;
                    },
                  ),
                  CustomFormField(
                    hint: "Enter Your Phone Number",
                    prefixIcon: const Icon(Icons.phone),
                    textcontroller: viewmodel.phoneController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "You must enter your phone number";
                      }
                      if (value.length < 11) {
                        return "phone number must be 11 numbers";
                      }
                      return null;
                    },
                    keyboardtype: TextInputType.phone,
                  ),
                  CustomFormField(
                    obsecure: !isvisible,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        isvisible = !isvisible;
                        setState(() {});
                      },
                      child: isvisible == true
                          ? const Icon(
                              Icons.visibility,
                              color: MyTheme.offWhite,
                            )
                          : const Icon(Icons.visibility_off,
                              color: MyTheme.offWhite),
                    ),
                    hint: "Enter Your Password",
                    prefixIcon: const Icon(Icons.lock_outline),
                    textcontroller: viewmodel.passwordController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "You must enter your password";
                      }
                      if (value.length < 8) {
                        return "password must be at least 8 characters";
                      }
                      return null;
                    },
                  ),
                  CustomFormField(
                    obsecure: !isvisible2,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        isvisible2 = !isvisible2;
                        setState(() {});
                      },
                      child: isvisible2 == true
                          ? const Icon(
                              Icons.visibility,
                              color: MyTheme.offWhite,
                            )
                          : const Icon(Icons.visibility_off,
                              color: MyTheme.offWhite),
                    ),
                    hint: "Confirm Your Password",
                    prefixIcon: const Icon(Icons.lock_outline),
                    textcontroller: viewmodel.confirmPassController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "You must confirm your password";
                      }
                      if (value != viewmodel.passwordController.text) {
                        return "password doesn't match";
                      }
                      return null;
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: mediaquery.height * 0.03,
                    ),
                    child: ElevatedButton(
                        onPressed: () {
                          createAccount();

                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(
                              mediaquery.width * 0.9,
                              mediaquery.height * 0.05)),
                        ),
                        child: Text(
                          "Sign up",
                          style: theme.textTheme.displayLarge!
                              .copyWith(fontWeight: FontWeight.w700),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: theme.textTheme.displayMedium,
                      ),
                      TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              textStyle: theme.textTheme.displayMedium),
                          child: const Text(
                            "SignIn",
                            style: TextStyle(fontSize: 17),
                          )),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }

  void createAccount() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
viewmodel.creatAccount(context);
  }

  @override
  SignUpViewModel initViewModel() {
    return SignUpViewModel();
  }

  @override
  goToLogin() {
    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  }
}
