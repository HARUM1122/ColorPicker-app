import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds:1),(){
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder:(context)=>const MainScreen()
      ));
    });
  }
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: SystemUiOverlay.values);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color:Theme.of(context).canvasColor,
      child:Center(
        child:Text(
          "COLOR PICKER",
          style:Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize:30,
            fontWeight: FontWeight.w600
          )
        )
      )
    );
  }
}