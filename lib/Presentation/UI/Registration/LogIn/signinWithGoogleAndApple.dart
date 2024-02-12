import 'package:flutter/material.dart';
import 'package:sbsr/Core/Theme/Theme.dart';

class SigninWithGoogleandApple extends StatelessWidget {
  const SigninWithGoogleandApple({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaquery = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: mediaquery.width * 0.03),
          margin: EdgeInsets.only(top: mediaquery.height*0.02,bottom:mediaquery.height*0.03 ),
          width: mediaquery.width * 0.7,
          height: mediaquery.height * 0.05,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: MyTheme.offWhite)),
          child: Row(
            children: [
              Image.asset(
                "Assets/image/google_icon.png",
                width: mediaquery.width * 0.07,
                height: mediaquery.height*0.03,
              ),
            const  VerticalDivider(
                thickness: 2,
                color: MyTheme.offWhite,
              ),
              Expanded(
                  child: Text(
                "Sign in with Google",
                style: theme.textTheme.displayLarge,
                textAlign: TextAlign.center,
              ))
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: mediaquery.width * 0.03),
          width: mediaquery.width * 0.7,
          height: mediaquery.height * 0.05,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: MyTheme.offWhite)),
          child: Row(
            children: [
              Image.asset(
                "Assets/image/apple_icon.png",
                width: mediaquery.width * 0.07,
                height: mediaquery.height*0.03,
              ),
            const  VerticalDivider(
                thickness: 2,
                color: MyTheme.offWhite,
              ),
              Expanded(
                  child: Text(
                "Sign in with Apple",
                style: theme.textTheme.displayLarge,
                textAlign: TextAlign.center,
              ))
            ],
          ),
        ),
      ],
    );
  }
}
