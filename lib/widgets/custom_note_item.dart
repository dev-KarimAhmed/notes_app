import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import '../views/edit_note_view.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({Key? key, required this.notes}) : super(key: key);
 final NoteModel notes;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context , MaterialPageRoute(builder: (context){
          return EditNoteView(
            note: notes,
          );
        }));
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 24, 0, 25),
        decoration: BoxDecoration(
          color: Color(notes.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(notes.title, style: const TextStyle(color: Colors.black),),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(notes.subTitle , style: const TextStyle(color: Colors.black45),),
              ),
              trailing: IconButton(
                onPressed: (){
                  notes.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
                icon: const Icon(Icons.delete , size: 30,),
                color: Colors.black,
              ),
              textColor: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(notes.date , style: const TextStyle(color: Colors.black45),),
            ),
          ],
        ),
      ),
    );
  }
}
