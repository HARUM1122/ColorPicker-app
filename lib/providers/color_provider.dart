import 'package:flutter/material.dart';
import '../utils/utils.dart';
class ColorProvider extends ChangeNotifier{
  HSVColor hsvColor = const HSVColor.fromAHSV(1.0, 0.0, 1.0, 1.0);
  String hex = "FF0000";
  Color rgbColor =const Color.fromRGBO(255,0,0,1);
  double calculatePercentage(BuildContext context,Offset localPos){
    RenderBox box = context.findRenderObject() as RenderBox;
    return ((localPos.dx-4)/(box.size.width-8)).clamp(0.0,1.0);
  }
  Offset calculatePercentOffset(BuildContext context,Offset localPos){
    final RenderBox box = context.findRenderObject() as RenderBox;
    return Offset(
      (localPos.dx/box.size.width).clamp(0.0,1.0),
      (1.0-(localPos.dy/box.size.height)).clamp(0.0,1.0)
    );
  }
  void resetColors(){
    hsvColor = const HSVColor.fromAHSV(1.0, 0.0, 1.0, 1.0);
    hex = "FF0000";
    rgbColor = const Color.fromRGBO(255,0,0,1);
    notifyListeners();
  }
  void hsvChanged(){
    hex = hsvToHex(hsvColor);
    rgbColor = hsvToRgb(hsvColor);
    notifyListeners();
  }
  void hexChanged(){
    hsvColor = hexToHsv(hex);
    rgbColor = hexToRgb(hex);
    notifyListeners();
  }
  void rgbChanged(){
    hex = rgbToHex(rgbColor);
    hsvColor = rgbToHsv(rgbColor);
    notifyListeners();
  }
  void onDragUpdate(DragUpdateDetails details,BuildContext context){
    final percentOffset = calculatePercentOffset(context,details.localPosition);
    hsvColor = HSVColor.fromAHSV(1.0,hsvColor.hue, percentOffset.dx, percentOffset.dy);
    hsvChanged();
  }
  void changeHex(String value){
    if(hex.length<6)hex+=value;
    hexChanged();
  }
  void bkps(){
    if(hex.isNotEmpty){
      hex = hex.substring(0,hex.length-1);
      hexChanged();
    }
  }
  void clear(){
    hex = "";
    hexChanged();
  }
  void onHsvSliderUpdate(DragUpdateDetails details,BuildContext context,int value,newColor){
    double percent = calculatePercentage(context,details.localPosition);
    hsvColor = newColor(percent*value);
    hsvChanged();
  }
  void onRgbSliderUpdate(DragUpdateDetails details,BuildContext context,int value,newColor){
    double percent = calculatePercentage(context,details.localPosition);
    rgbColor = newColor((percent*value).toInt());
    rgbChanged();
  }
}