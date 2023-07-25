
import 'package:flutter/material.dart';
import 'package:notes_app/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({required this.hintText , this.maxLines = 1, this.onSaved, this.onChanged});
  String hintText;
  int maxLines;
 final void Function(String)? onChanged;
 final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      onChanged: onChanged,
      validator: (value){
        if(value?.isEmpty ?? true ){
          return 'This field is required';
        }else{
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
          hintText: hintText,
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
