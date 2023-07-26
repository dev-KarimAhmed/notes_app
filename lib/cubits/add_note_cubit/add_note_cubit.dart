import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants/texts.dart';

import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app/models/note_model.dart';


class AddNotesCubit extends Cubit<AddNotesState>{
  AddNotesCubit(): super(AddNotesInitial());


 Color color = const Color(0xffC9231D);
  addNote({required NoteModel note}) async{
    note.color = color.value;
    emit(AddNotesLoading());
    try{
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      emit(AddNotesSuccess());
    }catch(e){
      emit(AddNotesFailure(errMsg: e.toString()));

    }
  }

}