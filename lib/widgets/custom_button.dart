import 'package:color_picker/constants/color_constants.dart';
import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;
  const CustomButton({
    required this.icon,
    required this.onPressed,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPressed,
      child:Container(
        width:20,
        height:20,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(129, 77, 255,1)
        ),
        child:Center(
          child: Icon(
            icon,
            size:18,
            color:white
          ),
        )
      )
    );
  }
}