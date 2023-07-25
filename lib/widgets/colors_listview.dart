
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

class ColorItem extends StatelessWidget {
   ColorItem({Key? key , required this.isActive, required this.color}) : super(key: key);
final bool isActive;
final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive ?
    CircleAvatar(
      radius: 36,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 32,
        backgroundColor: color,
      ),
    ) : CircleAvatar(
      radius: 32,
      backgroundColor: color,
    );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({Key? key}) : super(key: key);

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
 int currentIndex = 0;
 List<Color> colors = [
   Color(0xff776D5A),
   Color(0xffC9231D),
   Color(0xffA09CB0),
   Color(0xffA3B9C9),
   Color(0xffABDAE1),
   Color(0xffDDD8B8),
   Color(0xffB3CBB9),
   Color(0xff84A9C0),
   Color(0xff6A66A3),
   Color(0xff542E71),
 ];
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
                setState(() {
                  currentIndex = index;
                });
                BlocProvider.of<AddNotesCubit>(context).color = colors[index];
              },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ColorItem(
                    isActive: currentIndex == index,
                    color: colors[index],
                  ),
                )
            );
          }
      ),
    );
  }
}
