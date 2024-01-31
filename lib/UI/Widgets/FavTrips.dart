
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sbsr/Core/Theme/Theme.dart';
import 'package:sbsr/UI/Widgets/BusDetails.dart';

class FavTrips extends StatelessWidget {
  const FavTrips({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9),
      child: AspectRatio(
        aspectRatio: 30 / 9,
         child:InkWell(
          onTap: (){
           Navigator.pushNamed(context, BusDetails.routeName);
          },
          child: Container(
            padding: const EdgeInsets.only(bottom: 3,left: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: MyTheme.lightPurple,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Row(
                         children: [
                           const Icon(Icons.location_on_outlined,color: MyTheme.offWhite,size: 25,),
                           //from Database
                           const SizedBox(width: 4,),
                           Text("station 3 : Obour City Third distract",
                             style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w400),)
                         ],
                       ),
                    Expanded(child: Container()),
                    Stack(
                     //alignment: Alignment.topLeft,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            color: Colors.white,
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
                const SizedBox(height: 4,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                    Icon(EvaIcons.flag_outline,color:MyTheme.offWhite),
                   //from Database
                   const SizedBox(width: 4,),
                   Text("station 11 : fifth Settlement Elnarges ",
                     style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w400),
                   )
                 ],
               )
              ],
        ),
      ),
    ),
      ),
    );
  }
}
