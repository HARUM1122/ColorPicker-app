import 'package:color_picker/utils/extensions.dart';
import 'package:color_picker/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../../custom_slider.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import '../../../providers/color_provider.dart';
class RgbPage extends StatefulWidget {
  const RgbPage({super.key});

  @override
  State<RgbPage> createState() => _RgbPageState();
}

class _RgbPageState extends State<RgbPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ColorProvider>(
      builder:(context,colorProv,child)=>
      Padding(
        padding:const EdgeInsets.symmetric(horizontal:16,vertical:12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Red",
                  style:Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize:16
                  )
                ),
                const Spacer(),
                Text(
                  colorProv.rgbColor.red.toInt().toString(),
                  style:Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize:14
                  )
                ),
                10.horizontal,
                CustomButton(
                  icon:Icons.remove,
                  onPressed: (){
                    colorProv.rgbColor = colorProv.rgbColor.withRed(max(colorProv.rgbColor.red-1,0));
                    colorProv.rgbChanged();
                  },
                ),
                6.horizontal,
                CustomButton(
                  icon:Icons.add,
                  onPressed:(){
                    colorProv.rgbColor = colorProv.rgbColor.withRed(min(colorProv.rgbColor.red+1,255));
                    colorProv.rgbChanged();
                  },
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              height:14,
              child: CustomSlider(
                currentValue: colorProv.rgbColor.red.toDouble(),
                value: 255,
                dragUpdate:colorProv.onRgbSliderUpdate,
                gradient:LinearGradient(
                  colors:[
                    const HSVColor.fromAHSV(1.0, 0, 0, 0.090).toColor(),
                    const HSVColor.fromAHSV(1.0, 0.0, 1.0, 1.0).toColor()
                  ],
                  begin:Alignment.centerLeft,
                  end:Alignment.centerRight,
                ),
                newColor:colorProv.rgbColor.withRed
              ),
            ),
            6.vertical,
            Row(
              children: [
                Text(
                  "Green",
                  style:Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize:16
                  )
                ),
                const Spacer(),
                Text(
                  colorProv.rgbColor.green.toInt().toString(),
                  style:Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize:14
                  )
                ),
                10.horizontal,
                CustomButton(
                  icon:Icons.remove,
                  onPressed: (){
                    colorProv.rgbColor = colorProv.rgbColor.withGreen(max(colorProv.rgbColor.green-1,0));
                    colorProv.rgbChanged();
                  },
                ),
                6.horizontal,
                CustomButton(
                  icon:Icons.add,
                  onPressed:(){
                    colorProv.rgbColor = colorProv.rgbColor.withGreen(min(colorProv.rgbColor.green+1,255));
                    colorProv.rgbChanged();
                  },
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              height:14,
              child: CustomSlider(
                currentValue: colorProv.rgbColor.green.toDouble(),
                dragUpdate:colorProv.onRgbSliderUpdate,
                value:255,
                gradient:LinearGradient(
                  colors:[
                    const HSVColor.fromAHSV(1.0, 0, 0, 0.80).toColor(),
                    const HSVColor.fromAHSV(1.0, 120.0, 1.0, 1.0).toColor(),
                  ],
                  begin:Alignment.centerLeft,
                  end:Alignment.centerRight,
                ),
                newColor:colorProv.rgbColor.withGreen
              ),
            ),
            6.vertical,
            Row(
              children: [
                Text(
                  "Blue",
                  style:Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize:16
                  )
                ),
                const Spacer(),
                Text(
                  colorProv.rgbColor.blue.toInt().toString(),
                  style:Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize:14
                  )
                ),
                10.horizontal,
                CustomButton(
                  icon:Icons.remove,
                  onPressed: (){
                    colorProv.rgbColor = colorProv.rgbColor.withBlue(max(colorProv.rgbColor.blue-1,0));
                    colorProv.rgbChanged();
                  },
                ),
                6.horizontal,
                CustomButton(
                  icon:Icons.add,
                  onPressed:(){
                    colorProv.rgbColor = colorProv.rgbColor.withBlue(min(colorProv.rgbColor.blue+1,255));
                    colorProv.rgbChanged();
                  },
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              height:14,
              child: CustomSlider(
                currentValue: colorProv.rgbColor.blue.toDouble(),
                dragUpdate:colorProv.onRgbSliderUpdate,
                value:255,
                gradient:LinearGradient(
                  colors:[
                    const HSVColor.fromAHSV(1.0, 0, 0, 0.090).toColor(),
                    const HSVColor.fromAHSV(1.0, 240.0, 1.0, 1.0).toColor(),
                  ],
                  begin:Alignment.centerLeft,
                  end:Alignment.centerRight,
                ),
                newColor:colorProv.rgbColor.withBlue
              ),
            )
          ],
        ),
      ),
    );
  }
}