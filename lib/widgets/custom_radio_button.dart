import 'package:color_picker/utils/extensions.dart';
import 'package:flutter/material.dart';
class CustomRadio extends StatelessWidget {
  final String title;
  final Function() pressed;
  final bool selected;
  const CustomRadio({required this.title,required this.pressed, required this.selected,super.key});
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:pressed,
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width:20,
            height:20,
            padding:const EdgeInsets.all(4),
            margin:const EdgeInsets.only(top:20),
            decoration:BoxDecoration(
              color:selected?const Color.fromRGBO(129, 77, 255,1):Colors.transparent,
              borderRadius:BorderRadius.circular(10),
              border:!selected?Border.all(
                color:Colors.grey,
                width:1,
              ):null
            ),
            child:Container(
              decoration: BoxDecoration(
                color:selected?Theme.of(context).primaryColor:Colors.transparent,
                borderRadius:BorderRadius.circular(6)
              ),
            )
          ),
          10.horizontal,
          Text(
            title,
            style:Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w500
            )
          )
        ],
      )
    );
  }
}