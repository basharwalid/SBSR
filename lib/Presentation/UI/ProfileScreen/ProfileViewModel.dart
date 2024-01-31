import 'package:flutter/cupertino.dart';
import 'package:sbsr/Core/Base/BaseViewModel.dart';
import 'package:sbsr/Presentation/UI/ProfileScreen/ProfileNavigator.dart';

class ProfileViewModel extends BaseViewModel<ProfileNavigator>{
  TextEditingController editNameController = TextEditingController();
  TextEditingController editEmailController = TextEditingController();
  TextEditingController editPhoneNumberController = TextEditingController();

   String? nameValidation(String name){
    if(name.isEmpty)
      {
        return "Name field can't be empty";
      }
    else {
      return null;
    }
  }

  String? emailValidation(String email){
    if(email.isEmpty)
      {
        return "Email field can't be empty";
      }
    else if(!RegExp(r"^[a-zA-Z0-9.!#$%&'+/=?^_`{|}~-]+"
    r"@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?(?:.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?)$")
        .hasMatch(email)){
      return "Please enter a valid email";
    }
    else {
      return null;
    }
  }

  String? phoneNumberValidation(String phoneNubmer){
    if(phoneNubmer.isEmpty)
    {
      return "Number field can't be empty";
    }
    else if(phoneNubmer.length != 11){
      return "Phone number should contain 11 numbers";
    }
    else {
      return null;
    }
  }
}