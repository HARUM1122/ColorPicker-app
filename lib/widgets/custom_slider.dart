import 'package:flutter/material.dart';
class CustomSlider extends StatefulWidget {
  final double currentValue;
  final int value;
  final LinearGradient gradient;
  final Function dragUpdate;
  final dynamic newColor;
  const CustomSlider({
    required this.currentValue,
    required this.dragUpdate,
    required this.gradient,
    required this.newColor,
    required this.value,
    super.key,
  });
  @override
  State<CustomSlider> createState() => _CustomSliderState();
}
class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate:(details)=>widget.dragUpdate(details,context,widget.value,widget.newColor),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(4),
              gradient: widget.gradient
            ),
          ),
          selector()
        ],
      ),
    );
  }
  Widget selector(){
    double per = widget.currentValue/widget.value;
    return Align(
      alignment: Alignment(2*per-1.0,0.0),
      child:Container(
        color:Colors.white,
        width:2
      )
    );
  }
}
