import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../custom_text_field.dart';


class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = 'forgetPasswordScreen';
  TextEditingController emailController = TextEditingController();
  var regex = RegExp('[a-z0-9]+@[a-z]+.[a-z]{2,3}');

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset(
                "Assets/SVG/Forgot password-rafiki 1.svg",
                height: mediaquery.height * 0.25,
                width: mediaquery.width * 0.5,
              ),
              Text(
                "Forget Password",
                textAlign: TextAlign.center,
                style: theme.textTheme.displayLarge!
                    .copyWith(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: mediaquery.height * 0.05,
              ),
              Text(
                "please enter your email",
                style: theme.textTheme.displayLarge!
                    .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              CustomFormField(
                hint: "Enter Your Email",
                prefixIcon: Icon(Icons.email_outlined),
                textcontroller: emailController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "You must enter your email address";
                  }
                  if (!regex.hasMatch(value)) {
                    return "invalid email address";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: mediaquery.height * 0.04,
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                        Size(mediaquery.width * 0.9, mediaquery.height * 0.05)),
                  ),
                  child: Text(
                    "Send",
                    style: theme.textTheme.displayLarge!
                        .copyWith(fontWeight: FontWeight.w700),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't receive code?",
                    style: theme.textTheme.displayMedium,
                  ),
                  TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          textStyle: theme.textTheme.displayMedium),
                      child: const Text(
                        "resend",
                        style: TextStyle(fontSize: 17),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
