import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_note_item.dart';

class NotesList extends StatelessWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemBuilder: (context , index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: CustomNoteItem(),
        );
      }),
    );
  }
}
