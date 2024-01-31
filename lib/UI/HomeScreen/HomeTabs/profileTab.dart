
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import 'package:sbsr/Core/Base/CustomprofileTextField.dart';
import 'package:sbsr/Core/Theme/Theme.dart';


class profileTab extends StatefulWidget {
   static const String routeName="profile";
   profileTab({super.key}) {
   }

  @override
  State<profileTab> createState() => _profileTabState();
}

class _profileTabState extends State<profileTab> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: MyTheme.darkPurple,
     appBar: AppBar(
       title: Text("profile",
         style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.bold),
       ),
       centerTitle: true,
     ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
            //child: Column(
                children: [
                     Container(
                     child:  const Center(
                       child: CircleAvatar(
                         backgroundImage: AssetImage(
                           "Assets/image/profile.png",
                         ),
                         radius: 60,
                       ),
                     ),
                    ),

                Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Text("Your info",style: Theme.of(context).textTheme.displayLarge,),
                    ],
                  ),
                ),
                CustomprofileTextField(
                  controller: nameController,
                    label: " Display name" ,
                    inputType: TextInputType.text,
                    icon: EvaIcons.person_outline,
                    ),
                  const SizedBox(height: 20,),
                  CustomprofileTextField(
                    controller: emailController,
                    label: "Email Address" ,
                    inputType: TextInputType.text,
                    icon: EvaIcons.email_outline,
                  ),
                  const SizedBox(height: 20,),
                  CustomprofileTextField(
                    controller: phoneController,
                    label: "phone number" ,
                    inputType: TextInputType.text,
                    icon: EvaIcons.phone,
                  ),
                const SizedBox(height: 30,),

                  SizedBox(
                      height: 65,
                      width:double.infinity,
                      child: ElevatedButton(onPressed: (){
                      },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(MyTheme.lightPurple),

                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(" Edit Your info",style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 30),)
                            ],
                          )),
                    ),

                  const SizedBox(height: 30,),
                     SizedBox(
                      height: 65,
                      width:double.infinity,
                      child: ElevatedButton(onPressed: (){},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(const Color(0xFFF73645)),
                            iconSize: MaterialStateProperty.all(40),
                            //shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             const Icon(EvaIcons.log_out_outline),
                              Text("Sign Out",style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 30),)
                            ],
                          )),
                    ),

                ],
              ),
      ),

      //),
    );
  }
}
