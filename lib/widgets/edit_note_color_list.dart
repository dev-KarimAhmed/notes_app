import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../models/note_model.dart';
import 'colors_listview.dart';

class EditViewNotes extends StatefulWidget {
  const EditViewNotes({Key? key, required this.note}) : super(key: key);
  final NoteModel note;

  @override
  State<EditViewNotes> createState() => _EditViewNotesState();
}

class _EditViewNotesState extends State<EditViewNotes> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context , index){
            return GestureDetector(
                onTap: (){

                  currentIndex = index;
                  widget.note.color = kColors[index].value;
                  setState(() {

                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ColorItem(
                    isActive: currentIndex == index,
                    color: kColors[index],
                  ),
                )
            );
          }
      ),
    );
  }
}
