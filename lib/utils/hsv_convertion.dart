import 'package:flutter/material.dart';
import 'package:skein_color_convert/skein_color_convert.dart';

Color hsvToRgb(HSVColor hsvColor){
  Color color = hsvColor.toColor();
  return Color.fromRGBO(color.red, color.green, color.blue,1);
}
String hsvToHex(HSVColor hsvColor)=>
  convert.hsv.hex(hsvColor.hue,hsvColor.saturation*100,hsvColor.value*100);
  