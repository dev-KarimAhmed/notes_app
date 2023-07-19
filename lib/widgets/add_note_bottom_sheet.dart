
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(height: 20,),
          TextField(
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              hintText: 'Add note',
              hintStyle: TextStyle(color: kPrimaryColor),
              border: buildOutlineInputBorder(),
              enabledBorder: buildOutlineInputBorder(),
              focusedBorder: buildOutlineInputBorder(kPrimaryColor)
            ),
          ),
        ],
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
