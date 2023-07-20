import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/views/notes_view.dart';

import 'constants/texts.dart';

void main() async{

  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
  runApp( NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark , fontFamily: 'Poppins'),
      home: NotesView(),
    );
  }
}
