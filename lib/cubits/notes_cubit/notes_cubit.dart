
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../constants/texts.dart';
import '../../models/note_model.dart';
import 'notes_state.dart';

class NotesCubit extends Cubit<NotesState>{
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;

  fetchAllNotes(){
      var notesBox = Hive.box<NoteModel>(kNotesBox);
       notes = notesBox.values.toList();
       emit(NotesSuccess());
  }

  }

