import 'package:color_picker/utils/extensions.dart';
import 'package:color_picker/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../../custom_slider.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import '../../../providers/color_provider.dart';
class HsvPage extends StatefulWidget {
  const HsvPage({super.key});

  @override
  State<HsvPage> createState() => _HsvPageState();
}

class _HsvPageState extends State<HsvPage> {
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
                  "Hue",
                  style:Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize:16
                  )
                ),
                const Spacer(),
                Text(
                  colorProv.hsvColor.hue.toInt().toString(),
                  style:Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize:14
                  )
                ),
                10.horizontal,
                CustomButton(
                  icon:Icons.remove,
                  onPressed: (){
                    colorProv.hsvColor = colorProv.hsvColor.withHue(max(colorProv.hsvColor.hue-1,0));
                    colorProv.hsvChanged();
                  },
                ),
                6.horizontal,
                CustomButton(
                  icon:Icons.add,
                  onPressed:(){
                    colorProv.hsvColor = colorProv.hsvColor.withHue(min(colorProv.hsvColor.hue+1,360));
                    colorProv.hsvChanged();
                  },
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              height:14,
              child: CustomSlider(
                currentValue: colorProv.hsvColor.hue,
                value: 360,
                dragUpdate:colorProv.onHsvSliderUpdate,
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
                ),
                newColor:colorProv.hsvColor.withHue
              ),
            ),
            6.vertical,
            Row(
              children: [
                Text(
                  "Saturation",
                  style:Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize:16
                  )
                ),
                const Spacer(),
                Text(
                  (colorProv.hsvColor.saturation*100).toInt().toString(),
                  style:Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize:14
                  )
                ),
                10.horizontal,
                CustomButton(
                  icon:Icons.remove,
                  onPressed: (){
                    colorProv.hsvColor = colorProv.hsvColor.withSaturation(max(((colorProv.hsvColor.saturation*100)-1)/100,0));
                    colorProv.hsvChanged();
                  },
                ),
                6.horizontal,
                CustomButton(
                  icon:Icons.add,
                  onPressed:(){
                    colorProv.hsvColor = colorProv.hsvColor.withSaturation(min(((colorProv.hsvColor.saturation*100)+1)/100,1));
                    colorProv.hsvChanged();
                  },
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              height:14,
              child: CustomSlider(
                currentValue: colorProv.hsvColor.saturation,
                dragUpdate:colorProv.onHsvSliderUpdate,
                value:1,
                gradient:LinearGradient(
                  colors:[
                    const HSVColor.fromAHSV(1.0, 0, 0, 0.80).toColor(),
                    HSVColor.fromAHSV(1.0, colorProv.hsvColor.hue, 1.0, 1.0).toColor(),
                  ],
                  begin:Alignment.centerLeft,
                  end:Alignment.centerRight,
                ),
                newColor:colorProv.hsvColor.withSaturation
              ),
            ),
            6.vertical,
            Row(
              children: [
                Text(
                  "Value",
                  style:Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize:16
                  )
                ),
                const Spacer(),
                Text(
                  (colorProv.hsvColor.value*100).toInt().toString(),
                  style:Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize:14
                  )
                ),
                10.horizontal,
                CustomButton(
                  icon:Icons.remove,
                  onPressed: (){
                    colorProv.hsvColor = colorProv.hsvColor.withValue(max(((colorProv.hsvColor.value*100)-1)/100,0));
                    colorProv.hsvChanged();
                  },
                ),
                6.horizontal,
                CustomButton(
                  icon:Icons.add,
                  onPressed:(){
                    colorProv.hsvColor = colorProv.hsvColor.withValue(min(((colorProv.hsvColor.value*100)+1)/100,1));
                    colorProv.hsvChanged();
                  },
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              height:14,
              child: CustomSlider(
                currentValue: colorProv.hsvColor.value,
                dragUpdate:colorProv.onHsvSliderUpdate,
                value:1,
                gradient:LinearGradient(
                  colors:[
                    const HSVColor.fromAHSV(1.0, 0, 0, 0.090).toColor(),
                    const HSVColor.fromAHSV(1.0, 0, 0, 0.80).toColor(),
                  ],
                  begin:Alignment.centerLeft,
                  end:Alignment.centerRight,
                ),
                newColor:colorProv.hsvColor.withValue
              ),
            )
          ],
        ),
      ),
    );
  }
}