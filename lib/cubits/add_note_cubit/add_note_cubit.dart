import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app/models/note_model.dart';


class AddNotesCubit extends Cubit<AddNotesState>{
  AddNotesCubit(super.initialState);

  addNote({required NoteModel note}){

  }

}