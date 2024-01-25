import 'package:flutter/cupertino.dart';
import 'package:sbsr/Core/Base/BaseNavigator.dart';
import 'package:sbsr/Core/Providers/ThemeProvider.dart';

class BaseViewModel<N extends BaseNavigator> extends ChangeNotifier{
  N? navigator;
  ThemeProvider? themeProvider;
}