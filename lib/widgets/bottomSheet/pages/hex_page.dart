import 'package:color_picker/utils/extensions.dart';
import 'package:provider/provider.dart';
import '../../../providers/color_provider.dart';
import 'package:flutter/material.dart';
import '../hex_keypad_widget/keypad.dart';
class HexPage extends StatefulWidget {
  const HexPage({super.key});

  @override
  State<HexPage> createState() => _HexPageState();
}
class _HexPageState extends State<HexPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        16.vertical,
        Consumer<ColorProvider>(
          builder: (context,colorProv,child)=>
          Text(
            colorProv.hex,
            style:Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize:26
            )
          ),
        ),
        const KeyPad()
      ],
    );
  }
}
