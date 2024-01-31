import 'package:flutter/material.dart';
import 'package:sbsr/Core/Base/BaseViewModel.dart';
import 'package:sbsr/Core/Theme/Theme.dart';
import 'package:sbsr/UI/HomeScreen/HomeNavigator.dart';
import 'package:sbsr/UI/HomeScreen/HomeTabs/BusTrips.dart';
import 'package:sbsr/UI/HomeScreen/HomeTabs/HistoryTab.dart';
import 'package:sbsr/UI/HomeScreen/HomeTabs/mapTab.dart';
import 'package:sbsr/UI/HomeScreen/HomeTabs/profileTab.dart';

class HomeViewModel extends BaseViewModel<HomeNavigator>{
    int currentIndex = 0;
    List<Widget> tabsList = [
        MapTab(),
         BusTrips(),
        HistoryTab(),
         profileTab(),
        Container(color: MyTheme.darkGrey),
       Container(color: MyTheme.lightPurple),
        Container(color: MyTheme.orange),


    ];

    changeSelectedIndex(int selectedIndex){
        currentIndex = selectedIndex;
        notifyListeners();
    }
}