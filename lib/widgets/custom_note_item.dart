import 'package:flutter/material.dart';

import '../views/edit_note_view.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context , MaterialPageRoute(builder: (context){
          return EditNoteView();
        }));
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 24, 0, 25),
        decoration: BoxDecoration(
          color: Color(0xffFFCE7F),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text('Flutter Tips', style: TextStyle(color: Colors.black),),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text('Build your career with Tharwat samy' , style: TextStyle(color: Colors.black45),),
              ),
              trailing: IconButton(
                onPressed: (){},
                icon: Icon(Icons.delete , size: 30,),
                color: Colors.black,
              ),
              textColor: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text('May 21,2023' , style: TextStyle(color: Colors.black45),),
            ),
          ],
        ),
      ),
    );
  }
}
