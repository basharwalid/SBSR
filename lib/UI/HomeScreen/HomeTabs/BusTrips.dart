import 'package:flutter/material.dart';
import 'package:sbsr/Core/Theme/Theme.dart';
import 'package:sbsr/UI/Widgets/FavTrips.dart';

class BusTrips extends StatefulWidget {
  const BusTrips({super.key});

  @override
  State<BusTrips> createState() => _BusTripsState();
}

class _BusTripsState extends State<BusTrips> {
  final List favtrips = [
    'Trip1',
    'Trip2',
    'Trip 3',
    'Trip 4',
    'Trip 5',
    'Trip 6',
    'Trip 7'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            centerTitle:  true,
            title: Text("Available bus Trips",
              style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.bold) ,)
          ),
      body:SingleChildScrollView(
        child: Column(
              children: [
                     TextField(
                       style: const TextStyle(color:Colors.white),
                        decoration: InputDecoration(
                         filled: true,
                          fillColor: const Color(0xFF37306B),
                          border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Search",
                        hintStyle: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w400),
                        prefixIcon:const Icon(Icons.search,
                          size: 30,
                          color:MyTheme.offWhite,
                        ),
                         ),
                        ),
                Column(
                  children: favtrips.map((e) => const FavTrips()).toList(),
                ),
             ],
        ),
      ),
    );
  }
}
