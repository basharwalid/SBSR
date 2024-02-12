import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sbsr/Core/Base/BaseState.dart';
import 'package:sbsr/Core/Theme/Theme.dart';
import 'package:sbsr/Presentation/UI/GetStarted/IntroNavigator.dart';
import 'package:sbsr/Presentation/UI/GetStarted/IntroViewModel.dart';
import 'package:sbsr/Presentation/UI/HomeScreen/HomeView.dart';

import '../Registration/LogIn/login_view.dart';



class IntroView extends StatefulWidget {
  static const String routeName = "GetStarted";

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends BaseState<IntroView , IntroViewModel> implements IntroNavigator {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: IntroductionScreen(
              pages: viewModel!.getStartedContent
                  .map(
                    (content) => PageViewModel(
                      decoration: const PageDecoration(
                        fullScreen: true,
                         bodyFlex: 3,
                        footerFlex: 2,
                      ),
                      title: "",
                      footer: Text(content.description??"" ,
                        style: Theme.of(context).textTheme.displayLarge,
                        textAlign: TextAlign.center,
                      ),
                      bodyWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            content.image??"",
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width * 0.6,
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              onDone: () {
               goToLoginScreen();
              },
              showSkipButton: true,
              skip: Text("Skip",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: MyTheme.white)),
              onSkip: (){
               goToLoginScreen();
              },
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
          ),
        ],
      ),
    );
  }

  @override
  IntroViewModel initViewModel() {
    return IntroViewModel();
  }

  @override
  goToHomeScreen() {
    Navigator.pushReplacementNamed(context, HomeView.routeName);
  }

  @override
  goToLoginScreen() {
    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  }
}
