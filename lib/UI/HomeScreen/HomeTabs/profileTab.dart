
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sbsr/Core/Theme/Theme.dart';
import '../../Widgets/CustomerprofileTextField.dart';


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
     appBar: AppBar(
       title: Text("profile",
         style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.bold),
       ),
       centerTitle: true,
     ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
             child:Column(
                  children: [
                       const CircleAvatar(
                         backgroundImage: AssetImage(
                           "Assets/image/profile.png",
                         ),
                         radius: 60,
                       ),
                        const SizedBox(height: 30,),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Your info",
                              style: Theme.of(context).textTheme.displayLarge,),
                            ),
                          ],
                        ),
                  CustomprofileTextField(
                    controller: nameController,
                      label: " Display name" ,
                      inputType: TextInputType.text,
                      icon: Iconsax.personalcard_outline,
                      ),
                    const SizedBox(height: 30,),
                    CustomprofileTextField(
                      controller: emailController,
                      label: "Email Address" ,
                      inputType: TextInputType.text,
                      icon: EvaIcons.email_outline,
                    ),
                    const SizedBox(height: 30,),
                    CustomprofileTextField(
                      controller: phoneController,
                      label: "phone number" ,
                      inputType: TextInputType.text,
                      icon: EvaIcons.phone,
                    ),
                  const SizedBox(height: 30,),
                           ElevatedButton(onPressed: (){},
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(MyTheme.lightPurple),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Text(" Edit Your info",
                                      style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 30),),
                                  )
                                ],
                              )),
             
                    const SizedBox(height: 30,),
                    ElevatedButton(onPressed: (){},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color(0xffF73645)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.exit_to_app),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text("Sign Out ",
                                style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 30),),
                            )
                          ],
                        )),
                            ],
                              )
        
            ),
      ),
    );
  }
}
