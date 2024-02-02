
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sbsr/Core/Theme/Theme.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        padding: const EdgeInsets.only(bottom: 4,left: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: MyTheme.lightPurple,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(9),
                  child: Row(
                    children: [
                      const Icon(
                        Iconsax.location_outline,
                        color: MyTheme.offWhite,
                        size: 25,),
                      const SizedBox(width: 4,),
                      //from Database
                      Text("station 3 : Obour City Third distract", style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w400),)
                    ],
                  ),
                ),
                Expanded(child: Container()),
                Stack(
                  //alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(8),
                        ),
                        color: MyTheme.offWhite,
                      ),

                      child: const Icon(
                        Icons.favorite,
                        color: MyTheme.lightPurple,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  const Icon(Iconsax.flag_2_outline,color: MyTheme.offWhite,size: 25,),
                  const SizedBox(width: 4,),
                  //from Database
                  Text("station 11 : fifth Settlement Elnarges ",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
