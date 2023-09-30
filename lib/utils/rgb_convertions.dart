import 'package:flutter/material.dart';
import 'package:skein_color_convert/skein_color_convert.dart';

String rgbToHex(Color rgb)=>
  convert.rgb.hex(rgb.red,rgb.green,rgb.blue);
rgbToHsv(Color rgb){
  List hsv = convert.rgb.hsv(rgb.red,rgb.green,rgb.blue);
  return HSVColor.fromAHSV(1.0, hsv[0].toDouble(), hsv[1]/100, hsv[2]/100);
}