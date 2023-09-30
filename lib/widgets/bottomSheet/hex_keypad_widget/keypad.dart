import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/color_provider.dart';
import 'key.dart';
class KeyPad extends StatelessWidget {
  const KeyPad({super.key});
  @override
  Widget build(BuildContext context) {
    final ColorProvider colorProvider = Provider.of<ColorProvider>(context,listen:false);
    return Expanded(
      child: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        mainAxisSpacing: 6,
        crossAxisSpacing: 6
        ),
        children: [
          Button(
            value:"0",
            callback:()=>colorProvider.changeHex("0"),
          ),
          Button(
            value:"1",
            callback:()=>colorProvider.changeHex("1"),
          ),
          Button(
            value:"2",
            callback:()=>colorProvider.changeHex("2"),
          ),
          Button(
            value:"3",
            callback:()=>colorProvider.changeHex("3"),
          ),
          Button(
            value:"4",
            callback:()=>colorProvider.changeHex("4"),
          ),
          Button(
            value:"5",
            callback:()=>colorProvider.changeHex("5"),
          ),
          Button(
            value:"6",
            callback:()=>colorProvider.changeHex("6"),
          ),
          Button(
            value:"7",
            callback:()=>colorProvider.changeHex("7"),
          ),
          Button(
            value:"8",
            callback:()=>colorProvider.changeHex("8"),
          ),
          Button(
            value:"9",
            callback:()=>colorProvider.changeHex("9"),
          ),
          Button(
            value:"A",
            callback:()=>colorProvider.changeHex("A"),
          ),
          Button(
            value:"B",
            callback:()=>colorProvider.changeHex("B"),
          ),
          Button(
            value:"C",
            callback:()=>colorProvider.changeHex("C"),
          ),
          Button(
            value:"D",
            callback:()=>colorProvider.changeHex("D"),
          ),
          Button(
            value:"E",
            callback:()=>colorProvider.changeHex("E"),
          ),
          Button(
            value:"F",
            callback:()=>colorProvider.changeHex("F"),
          ),
          Button(
            value:"<",
            callback:()=>colorProvider.bkps(),
          ),
          Button(
            value:"C",
            callback:()=>colorProvider.clear(),
          )
        ]
      ),
    );
  }
}