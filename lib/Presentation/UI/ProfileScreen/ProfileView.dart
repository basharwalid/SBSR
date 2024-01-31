import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sbsr/Core/Base/BaseState.dart';
import 'package:sbsr/Presentation/UI/ProfileScreen/ProfileNavigator.dart';
import 'package:sbsr/Presentation/UI/ProfileScreen/ProfileViewModel.dart';
import 'package:sbsr/Presentation/UI/Widgets/CustomTextField.dart';

class ProfileView extends StatefulWidget {
  ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends BaseState<ProfileView, ProfileViewModel> implements ProfileNavigator{
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile",),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("Assets/image/Group 36251.png"),
              radius: 55,
            ),
            const SizedBox(
              height: 30,
            ),
            Text("Edit your info",
                style: theme.textTheme.displayLarge
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
              inputType: TextInputType.name,
              validation: viewModel!.nameValidation,
              controller: viewModel!.editNameController,
              prefixIcon: const Icon(Iconsax.personalcard_outline,size: 30,) ,
              hintText: "Edit Display Name",
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
              inputType: TextInputType.emailAddress,
              validation: viewModel!.emailValidation,
              controller: viewModel!.editEmailController,
              prefixIcon: const Icon(Icons.email_outlined,size: 30,) ,
              hintText: "Edit Email Name",
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
              inputType: TextInputType.phone,
              validation: viewModel!.phoneNumberValidation,
              controller: viewModel!.editPhoneNumberController,
              prefixIcon: const Icon(Icons.phone ,size: 30,) ,
              hintText: "Edit Phone Name",
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: updateButton,
              style: const ButtonStyle(
              ), child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text("Update"),
                ),
              ],
            ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: updateButton,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color(0xffF73645)),
              ), child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Icon(Icons.exit_to_app, size: 30,),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Sign Out"),
                    ],
                  ),

                ),
              ],
            )
            ),
          ],
        ),
      ),
    );
  }

  @override
  ProfileViewModel initViewModel() {
    return ProfileViewModel();
  }

  void updateButton() {
  }
}
