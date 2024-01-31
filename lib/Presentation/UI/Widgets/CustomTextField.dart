import 'package:flutter/material.dart';
import 'package:sbsr/Core/Theme/Theme.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  Icon? prefixIcon;
  String? hintText;
  Function validation;
  TextInputType inputType;
  CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.validation,
      required this.inputType,
      required this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
      controller: controller,
      style: theme.textTheme.displayLarge,
      keyboardType: inputType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => validation(value),
      decoration: InputDecoration(
          fillColor: MyTheme.offWhite.withOpacity(0.20),
          filled: true,
          prefixIcon: prefixIcon,
          prefixIconColor: MyTheme.darkPurple,
          hintText: hintText,
        hintStyle: theme.textTheme.displayLarge!.copyWith(
          color: MyTheme.white.withOpacity(0.20),
        ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(width: 2, color: MyTheme.lightPurple)
          ),
          suffixIcon: Icon(Icons.edit , size: 25, color: Colors.white,)
      ),
    );
  }
}
