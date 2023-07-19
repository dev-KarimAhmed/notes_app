
import 'package:flutter/material.dart';
import 'package:notes_app/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({required this.hintText , this.maxLines = 1});
  String hintText;
  int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: kPrimaryColor),
          border: buildOutlineInputBorder(),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(kPrimaryColor)
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
            color: color ?? Colors.white
        )
    );
  }
}
