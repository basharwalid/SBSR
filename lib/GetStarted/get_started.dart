import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sbsr/Core/Theme/Theme.dart';
import 'package:sbsr/GetStarted/contents.dart';

class GetStarted extends StatelessWidget {
  static const String routeName = "GetStarted";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: IntroductionScreen(
        pages: getstarted_content
            .map(
              (content) => PageViewModel(
                title: "",
                bodyWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      content.img,
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.6,
                    ),
                    SizedBox(height: 15),
                    Text(
                      content.discr,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
            .toList(),
        onDone: () {
          // Handle what to do when done
        },
        showSkipButton: true,
        skip: Text("Skip",
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: MyTheme.white)),
        done: Text(
          "Done",
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: MyTheme.white),
        ),
        next: Text("Next",
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: MyTheme.white)),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }
}
