import 'package:flutter/material.dart';
import '../../../Core/Theme/Theme.dart';


class CustomFormField extends StatelessWidget {
  final String hint;
  final FormFieldValidator<String?> validator;
  final TextEditingController textcontroller;
  Widget? suffixIcon;
  bool obsecure;
  Widget prefixIcon;
  TextInputType keyboardtype;
  CustomFormField(
      {required this.hint,
      required this.prefixIcon,
      required this.textcontroller,
      required this.validator,
      this.obsecure = false,
      this.suffixIcon,
      this.keyboardtype = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaquery = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
          top: mediaquery.height * 0.02,
          right: mediaquery.width * 0.05,
          left: mediaquery.width * 0.05),
      child: TextFormField(
        keyboardType: keyboardtype,
        controller: textcontroller,
        style: theme.textTheme.displayLarge,
        validator: validator,
        obscureText: obsecure,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          fillColor: MyTheme.offWhite.withOpacity(0.2),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          prefixIcon: prefixIcon,
          prefixIconColor: MyTheme.white.withOpacity(0.7),
          suffixIcon: suffixIcon,
          hintText: hint,
          hintStyle: theme.textTheme.displayMedium,
        ),
      ),
    );
  }
}
