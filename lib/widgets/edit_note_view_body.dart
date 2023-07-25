import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

import 'edit_note_color_list.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title,subTitle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CustomAppBar(
              text: 'Edit Note',
              icon: Icons.check,
              onTap: (){
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = subTitle ?? widget.note.subTitle;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
          ),
          SizedBox(
            height: 50,
          ),
          CustomTextField(
            onChanged: (value){
              title = value;
            },
              hintText: 'Title'
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            onChanged: (value){
              subTitle = value;
            },
            hintText: 'Content',
            maxLines: 5,
          ),
          SizedBox(
            height: 20,
          ),
          EditViewNotes(note: widget.note),
        ],
      ),
    ));
  }
}

