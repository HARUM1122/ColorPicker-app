import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  final String value;
  final Function() callback;
  const Button({
    required this.value,
    required this.callback,
    super.key
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).cardColor,
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        )
      ),
      onPressed: callback,
      child:Center(
        child:Text(
          value,
          style:Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize:18
          )
        )
      )
    );
  }
}