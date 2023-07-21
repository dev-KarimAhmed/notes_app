import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants/texts.dart';

import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app/models/note_model.dart';


class AddNotesCubit extends Cubit<AddNotesState>{
  AddNotesCubit(): super(AddNotesInitial());
  addNote({required NoteModel note}) async{
    emit(AddNotesLoading());
    try{
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      emit(AddNotesSuccess());
      await notesBox.add(note);
    }catch(e){
      emit(AddNotesFailure(errMsg: e.toString()));

    }
  }

}