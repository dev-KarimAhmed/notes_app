
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../constants/texts.dart';
import '../../models/note_model.dart';
import 'notes_state.dart';

class NotesCubit extends Cubit<NotesState>{
  NotesCubit() : super(NotesInitial());

  fetchAllNotes(){
    try{
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      List<NoteModel> notes = notesBox.values.toList();
      emit(NotesSuccess(notes));
    }catch(e){
      emit(NotesFailure(e.toString()));

    }
  }
  }

