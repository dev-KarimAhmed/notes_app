

import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.text, required this.icon, this.onTap
  });
 final String text;
 final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        Text(
          text,
          style: TextStyle(
              fontSize: 24
          ),
        ),
        CustomIconButton(icon: icon , onTap: onTap),
      ],
    );
  }
}


