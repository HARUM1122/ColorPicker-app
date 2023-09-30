import 'package:flutter/material.dart';
void showSheet(
  BuildContext context,{
  required Widget child,}){
  showModalBottomSheet(
    isScrollControlled: true,
    context: context, 
    builder: (BuildContext context)=>child
  );
}