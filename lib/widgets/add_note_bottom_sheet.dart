
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
        child: AddNoteForm(),
      ),
    );
  }



}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title,subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          SizedBox(height: 20,),
          CustomTextField(hintText: 'Title' , onSaved: (value){
            title = value;
          }),
          SizedBox(height: 20,),
          CustomTextField(hintText: 'Content' , maxLines: 5, onSaved: (value){
            subTitle = value;
          },),
          SizedBox(height: 20,),
          CustomButton(
            onTap: (){
              if(formKey.currentState!.validate()){
                formKey.currentState!.save();
              }else{
                setState(() {
                  autoValidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}

