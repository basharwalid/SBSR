import 'package:flutter/material.dart';
import 'package:sbsr/Core/Theme/Theme.dart';

class BusDetails extends StatefulWidget {
  static const String routeName='Bus';
  const BusDetails({super.key});

  @override
  State<BusDetails> createState() => _BusDetailsState();
}

class _BusDetailsState extends State<BusDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.darkPurple,
      appBar: AppBar(

      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset('Assets/image/logo-black 2.png'),
          ),
          const SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text("Bus Details",style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.bold)),
          ),
            Padding(
             padding: const EdgeInsets.all(12),
             child: Container(
             height: MediaQuery.of(context).size.width*1.0,
              width: MediaQuery.of(context).size.height*1.0,
               decoration: BoxDecoration(
                 color: const Color(0xFF37306B).withOpacity(0.8),
                 borderRadius: BorderRadius.circular(30),
               ),
               child: Padding(
                 padding: const EdgeInsets.all(12.0),
                 child: Column(
                   children: [
                     const Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.favorite_outline,size: 30,color: MyTheme.offWhite,),
                      ],
                     ),
                     //Text From DataBase
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("Bus name",
                           style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w400),)
                       ],
                     ),
                     const SizedBox(height: 20,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                       Text("From:  station 3 : Obour City Third distract ",
                         style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w400),
                       )
                       ],
                     ),
                     const SizedBox(height: 20,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("To: station 11 : fifth Settlement Elnarges  ",
                           style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w400),
                         )
                       ],
                     ),
                     const SizedBox(height: 20,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("station number:Station 3  ",
                           style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w400),
                         )
                       ],
                     ),
                     const SizedBox(height: 20,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("station name:Third distract station ",
                           style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w400),
                         )
                       ],
                     ),
                     const SizedBox(height: 20,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("Est. time to arrive:12min ",
                           style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w400),
                         )
                       ],
                     ),

                   ],
                 ),
               )
               ,
             ),
           ),
        const SizedBox(height: 8,),
        Row(
          children: [
            const Icon(Icons.crop_square_sharp,color: MyTheme.offWhite,),
           const SizedBox(width: 15,),
            Text("Remind me when the bus is near the",
                style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
          ],
        ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("station",style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.bold),),
            ],
          ),
    ],
              ),
    );
  }

}
