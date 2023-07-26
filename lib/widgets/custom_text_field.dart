
import 'package:flutter/material.dart';
import 'package:notes_app/constants/colors.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({super.key, required this.hintText , this.maxLines = 1, this.onSaved, this.onChanged});
  String hintText;
  int maxLines;
 final void Function(String)? onChanged;
 final void Function(String?)? onSaved;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
      validator: (value){
        if(value?.isEmpty ?? true ){
          return 'This field is required';
        }else{
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
          hintText: widget.hintText,
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
