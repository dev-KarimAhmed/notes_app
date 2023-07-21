import 'package:flutter/material.dart';
import 'package:notes_app/constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, this.onTap,  this.isLoading = false}) : super(key: key);
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: isLoading ? SizedBox(
            height: 24,
            width: 24,
            child: CircularProgressIndicator(
             color: Colors.black,
            ),
          )
              : Text('Add' , style: TextStyle(color: Colors.black , fontSize: 18 , fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
