import 'package:flutter/material.dart';
import 'package:sbsr/Core/Base/BaseState.dart';
import 'package:sbsr/Presentation/UI/HomeScreen/HomeView.dart';
import 'package:sbsr/Presentation/UI/Registration/LogIn/signinWithGoogleAndApple.dart';
import '../../../../Core/Theme/Theme.dart';
import '../ForgetPassword/forgetpassword_view.dart';
import '../SignUp/signup_view.dart';
import '../custom_text_field.dart';
import 'LoginNavigator.dart';
import 'LoginViewModel.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login-view';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen, LoginViewModel> implements LoginNavigator {
  var regex = RegExp('[a-z0-9]+@[a-z]+.[a-z]{2,3}');
  bool isvisible = false;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaquery = MediaQuery
        .of(context)
        .size;
   var viewmodel = LoginViewModel();
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
                    "Sign In",
                    style: theme.textTheme.displayLarge!
                        .copyWith(fontSize: 35, fontWeight: FontWeight.w600),
                  ),
                  CustomFormField(
                    hint: "Enter Your Email",
                    prefixIcon: const Icon(Icons.email_outlined),
                    validator: (value) {
                      if (value == null || value
                          .trim()
                          .isEmpty) {
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
                    textcontroller: viewmodel.passController,
                    obsecure: !isvisible,
                    hint: "Enter Your Password",
                    prefixIcon: const Icon(Icons.lock),
                    validator: (value) {
                      if (value == null || value
                          .trim()
                          .isEmpty) {
                        return "You must enter your password";
                      }
                      if (value.length < 8) {
                        return "password must be at least 8 characters";
                      }
                      return null;
                    },
                    suffixIcon: GestureDetector(
                      onTap: () {
                        isvisible = !isvisible;
                        setState(() {});
                      },
                      child: isvisible == true
                          ? const Icon(
                        Icons.visibility,
                        color: Color(0xff727477),
                      )
                          : const Icon(Icons.visibility_off,
                          color: MyTheme.offWhite),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: MyTheme.offWhite,
                            textStyle: theme.textTheme.bodyMedium),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, ForgetPasswordScreen.routeName);
                        },
                        child: const Text("Forget password?")),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Login();
                      },
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(
                            mediaquery.width * 0.9, mediaquery.height * 0.05)),
                      ),
                      child: Text(
                        "Signin",
                        style: theme.textTheme.displayLarge!
                            .copyWith(fontWeight: FontWeight.w700),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have account?",
                        style: theme.textTheme.displayMedium,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, SignUpScreen.routeName);
                          },
                          style: TextButton.styleFrom(
                              textStyle: theme.textTheme.displayMedium),
                          child: const Text(
                            "SignUp",
                            style: TextStyle(fontSize: 17),
                          )),
                    ],
                  ),
                  Text(
                    "or",
                    style: theme.textTheme.displayLarge,
                  ),
                  const SigninWithGoogleandApple(),
                ],
              ),
            );
          }),
    );
  }

  void Login() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
   viewModel!.Login(context);
  }

  @override
  LoginViewModel initViewModel() {
    return LoginViewModel();
  }

  @override
  goToSignUp() {
   Navigator.pushReplacementNamed(context, SignUpScreen.routeName);
  }

  @override
  goToHome() {
    Navigator.pushReplacementNamed(context, HomeView.routeName);
  }
}
