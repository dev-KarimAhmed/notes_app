


import 'package:flutter/material.dart';

import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';




class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomAppBar(text: 'Edit Note', icon: Icons.check),
              SizedBox(height: 50,),
              CustomTextField(hintText: 'Title'),
              SizedBox(height: 20,),
              CustomTextField(hintText: 'Content' ,maxLines: 5,),
            ],
          ),
        )
    );
  }
}
