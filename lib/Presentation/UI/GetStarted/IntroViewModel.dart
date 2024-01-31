import 'package:sbsr/Core/Base/BaseViewModel.dart';
import 'package:sbsr/Presentation/UI/GetStarted/IntroNavigator.dart';
import 'package:sbsr/Presentation/UI/GetStarted/contents.dart';

class IntroViewModel extends BaseViewModel<IntroNavigator>{

  List<Content> getStartedContent = [
    Content(
        image: "Assets/SVG/city_bus_rafiki_1.svg",
        description:
        "welcome to our App where \n you can know bus schedules \n And all the bus Routes"),
    Content(
        image: "Assets/SVG/Bus Stop-bro 1.svg",
        description:
        "wherever you are in any station \n you can get information about \n the upcoming bus and Estimated time"),
    Content(
        image: "Assets/SVG/Bus driver-pana 1.svg",
        description:
        "Get announces to you favorite \n bus Line and Also get the \n announce before the bus arrives while \n you are sitting in home or without \n doing any hard work"),
    Content(
        image: "Assets/SVG/Mobile-pana 1.svg",
        description:
        "So join us in this incredible journey so \n you can get the all the Public \n transportation buses Details as fast \n as possible wherever you are located")
  ];


  goToHomeScreen(){
     navigator!.goToHomeScreen();
  }
}