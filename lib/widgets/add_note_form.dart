import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import '../cubits/add_note_cubit/add_note_cubit.dart';
import '../cubits/add_note_cubit/add_note_state.dart';

import '../models/note_model.dart';
import 'colors_listview.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

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
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
              hintText: 'Title',
              onSaved: (value) {
                title = value;
              }),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            hintText: 'Content',
            maxLines: 5,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const ColorsListView(),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<AddNotesCubit, AddNotesState>(
            builder: (context, state) => CustomButton(
              isLoading: state is AddNotesLoading ? true : false,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  var note = NoteModel(
                      title: title!,
                      subTitle: subTitle!,
                      date: DateFormat.yMEd().add_jm().format(DateTime.now()),
                      color: Colors.blue.value);
                  BlocProvider.of<AddNotesCubit>(context).addNote(note: note);
                } else {
                  setState(() {
                    autoValidateMode = AutovalidateMode.always;
                  });
                }

                showToast(
                  'Note was added successfuly',
                  context: context,
                  animation: StyledToastAnimation.scale,
                  reverseAnimation: StyledToastAnimation.fade,
                  position: StyledToastPosition.bottom,
                  animDuration: Duration(seconds: 1),
                  duration: Duration(seconds: 4),
                  curve: Curves.elasticOut,
                  reverseCurve: Curves.linear,
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
