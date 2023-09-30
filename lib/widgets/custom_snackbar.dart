import 'package:flutter/material.dart';
void showSnackBar_(context)=>
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6)
      ),
      backgroundColor: Theme.of(context).cardColor,
      duration:const Duration(seconds:2),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.up,
      margin:const EdgeInsets.only(
        left:20,
        right:20,
        bottom:20
      ),
      content:Text(
        "Color copied",
        style:Theme.of(context).textTheme.titleSmall!.copyWith(
          fontSize:18,
        )
      )
    )
  );