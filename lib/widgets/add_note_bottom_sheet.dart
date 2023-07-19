
import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

import 'custom_button.dart';



class AddNoteBottomSheet extends StatelessWidget {
   AddNoteBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            CustomTextField(hintText: 'Title' ),
            SizedBox(height: 20,),
            CustomTextField(hintText: 'Content' , maxLines: 5, ),
            SizedBox(height: 20,),
            CustomButton(),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }



}

