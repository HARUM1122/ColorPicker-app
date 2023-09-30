import 'package:flutter/material.dart';
import 'package:skein_color_convert/skein_color_convert.dart';

HSVColor hexToHsv(String hex){
  if(hex.isEmpty)return const HSVColor.fromAHSV(1,0,1,1);
  List hsv = convert.hex.hsv(hex);
  return HSVColor.fromAHSV(1, double.parse(hsv[0].toString()), hsv[1]/100, hsv[2]/100);
}
Color hexToRgb(String hex){
  if(hex.isEmpty)return const Color.fromRGBO(255, 0, 0, 1);
  List rgb = convert.hex.rgb(hex);
  return Color.fromRGBO(rgb[0],rgb[1],rgb[2],1);
}