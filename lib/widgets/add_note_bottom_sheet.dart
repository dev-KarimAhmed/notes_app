
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/widgets/add_note_form.dart';
import '../cubits/add_note_cubit/add_note_cubit.dart';
import '../cubits/add_note_cubit/add_note_state.dart';


class AddNoteBottomSheet extends StatelessWidget {
 const  AddNoteBottomSheet();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return AddNotesCubit();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: BlocConsumer<AddNotesCubit , AddNotesState>(
                listener: (context , state){
                  if(state is AddNotesFailure){
                    print('Failed ${state.errMsg}');
                  }else if(state is AddNotesSuccess){
                    Navigator.pop(context);
                  }

                },
            builder: (context,state){
                  return ModalProgressHUD(
                    inAsyncCall: state is AddNotesLoading ? true : false ,
                      child: SingleChildScrollView(child: AddNoteForm())
                  );
            },
        ),
      ),
    );
  }

}

