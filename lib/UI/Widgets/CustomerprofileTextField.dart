import 'package:flutter/material.dart';
import '../../Core/Theme/Theme.dart';

class CustomprofileTextField extends StatelessWidget {
  TextEditingController controller;
  String label;
  TextInputType inputType;
  IconData icon;
  CustomprofileTextField({
    required this.controller,
    required this.label,
    required  this.inputType,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: Theme.of(context).textTheme.displayLarge,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor:  Colors.grey.withOpacity(0.4),
        hintText: label,
        hintStyle: Theme.of(context).textTheme.displayMedium,
        prefixIcon:Icon(icon,size: 30,),
        //suffixIcon: Icon(Icons.edit,color: Colors.white,),
        prefixIconColor: MyTheme.darkPurple,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 2,
              color: Colors.red,
            )),
      ),
    );

  }
}