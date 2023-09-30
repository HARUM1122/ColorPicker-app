import 'package:flutter/material.dart'; 
class ColorPicker extends StatefulWidget {
  final HSVColor hsvColor;
  final Function(DragUpdateDetails details, BuildContext context) dragUpdate;
  const ColorPicker({
    required this.hsvColor,
    required this.dragUpdate,
    super.key
  });
  @override
  State<ColorPicker> createState() => _ColorPickerState();
}
class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details)=>widget.dragUpdate(details,context),
      child:LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CustomPaint(
                  painter:ColorPickerPainter(
                    hue:widget.hsvColor.hue
                  ),
                  size:Size.infinite
                ),
              ),
              buildSelector(Size(constraints.maxWidth,constraints.maxHeight))
            ],
          );
        }
      )
    );
  }
  Widget buildSelector(Size size){
    final double saturationPercent = widget.hsvColor.saturation;
    final double darknessPercent = 1.0-widget.hsvColor.value;
    return Positioned(
        left:size.width*saturationPercent,
        top:size.height*darknessPercent,
        child:FractionalTranslation(
          translation: const Offset(-0.5,-0.5),
          child: Container(
            width:20,
            height:20,
            decoration: BoxDecoration(
              shape:BoxShape.circle,
              border:Border.all(
                color:darknessPercent>=0.5?Colors.white:Colors.black,
                width:2
              )
            ),
          ),
        )
      );
    }
  }
class ColorPickerPainter extends CustomPainter{
  double hue;
  ColorPickerPainter({
    required this.hue
  });
  @override
  void paint(Canvas canvas, Size size) {
    final Shader lightGradientShader = const LinearGradient(
      colors:[Colors.white,Colors.black],
      begin:Alignment.topCenter,
      end:Alignment.bottomCenter
    ).createShader(Offset.zero & size);
    final lightPaint = Paint()..shader = lightGradientShader;
    canvas.drawRect(Offset.zero & size, lightPaint);
    final Shader saturationGradientShader = LinearGradient(
      colors:[
        HSVColor.fromAHSV(1.0, hue, 0.0, 1.0).toColor(),
        HSVColor.fromAHSV(1.0, hue, 1.0, 1.0).toColor()
      ],
      begin:Alignment.centerLeft,
      end:Alignment.centerRight
    ).createShader(Offset.zero & size);
    final saturationPaint = Paint()..shader = saturationGradientShader..blendMode = BlendMode.modulate;
    canvas.drawRect(Offset.zero & size, saturationPaint);
  }
  @override
  bool shouldRepaint(ColorPickerPainter oldDelegate) {
    return hue!=oldDelegate.hue;
  }
}
