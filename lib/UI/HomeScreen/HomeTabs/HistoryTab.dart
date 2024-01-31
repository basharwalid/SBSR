import 'package:flutter/material.dart';
import 'package:sbsr/Core/Theme/Theme.dart';
import 'package:sbsr/UI/Widgets/HistoryWidget.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});
  static const String routeName="History";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.darkPurple,
        appBar: AppBar(
          title: Text("History Trips",
            style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
           body:Column(
            children: [
           Expanded(
             child: ListView.builder(itemBuilder: (context,index){
               return const HistoryWidget();
                 },
               itemCount: 20,
                 ),
           ),
                ],
                ),


      );

  }
}

