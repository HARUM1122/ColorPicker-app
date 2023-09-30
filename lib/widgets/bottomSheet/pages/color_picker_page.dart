import 'package:color_picker/widgets/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/extensions.dart';
import '../../../providers/color_provider.dart';
import '../../saturation_value_picker.dart';
class ColorPickerPage extends StatelessWidget {
  const ColorPickerPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<ColorProvider>(
      builder:(context,colorProv,child)=>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical:12),
        child: Column(
          children: [
            Expanded(
              flex:8,
              child: ColorPicker(
                hsvColor:colorProv.hsvColor,
                dragUpdate: colorProv.onDragUpdate,
              ),
            ),
            20.vertical,
            SizedBox(
              width: double.infinity,
              height:20,
              child: CustomSlider(
                currentValue: colorProv.hsvColor.hue,
                value: 360,
                dragUpdate: colorProv.onHsvSliderUpdate,
                newColor: colorProv.hsvColor.withHue,
                gradient:LinearGradient(
                  colors:[
                    const HSVColor.fromAHSV(1.0, 0.0, 1.0, 1.0).toColor(),
                    const HSVColor.fromAHSV(1.0, 51, 1.0, 1.0).toColor(),
                    const HSVColor.fromAHSV(1.0, 102, 1.0, 1.0).toColor(),
                    const HSVColor.fromAHSV(1.0, 153, 1.0, 1.0).toColor(),
                    const HSVColor.fromAHSV(1.0, 204, 1.0, 1.0).toColor(),
                    const HSVColor.fromAHSV(1.0, 255, 1.0, 1.0).toColor(),
                    const HSVColor.fromAHSV(1.0, 306, 1.0, 1.0).toColor(),
                    const HSVColor.fromAHSV(1.0, 360, 1.0, 1.0).toColor(),
                  ],
                  begin:Alignment.centerLeft,
                  end:Alignment.centerRight,
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}

