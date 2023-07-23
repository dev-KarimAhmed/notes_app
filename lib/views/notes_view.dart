
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet.dart';


import '../cubits/notes_cubit/notes_cubit.dart';
import '../widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => NotesCubit(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (){
          showModalBottomSheet(
            isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)
              ),
              context: context, builder: (context){
            return AddNoteBottomSheet();
          });
        } , child: Icon(Icons.add),),
        body: NotesViewBody(),
      ),
    );
  }
}
