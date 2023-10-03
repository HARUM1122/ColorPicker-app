import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/color_constants.dart';
class ThemeProvider extends ChangeNotifier{
  Future<SharedPreferences> prefs_ = SharedPreferences.getInstance();
  ThemeMode themeMode = ThemeMode.system;
  ThemeProvider(){
    prefs_.then((SharedPreferences prefs){
      String currentThemeMode = prefs.getString('theme')??'';
      switch (currentThemeMode){
        case "ThemeMode.light":
          themeMode = ThemeMode.light;
        case "ThemeMode.dark":
          themeMode = ThemeMode.dark;
        default:
          themeMode = ThemeMode.system;
      }
      notifyListeners();    
    });
  }
  ThemeData lightTheme(){
    return ThemeData(
      canvasColor: white,
      cardColor:white2,
      primaryColor:white,
      appBarTheme:const AppBarTheme(
        titleTextStyle: TextStyle(
          color:black,
          fontSize:32,
          fontWeight: FontWeight.w500
        ),
        color:white,
        elevation: 0
      ),
      iconTheme: const IconThemeData(
        color:black,
        size:30
      ),
      textTheme:const TextTheme(
        labelMedium: TextStyle(
          color:black,
          fontSize:22,
          fontWeight: FontWeight.w600
        ),
        labelSmall: TextStyle(
          color:black,
          fontSize:16,
        ),
      )
    );
  }
  ThemeData darkTheme()=>ThemeData(
    canvasColor: black,
    cardColor:black2,
    primaryColor:black,
    appBarTheme:const AppBarTheme(
      titleTextStyle: TextStyle(
        color:white,
        fontSize:32,
        fontWeight: FontWeight.w500
      ),
      color:black,
      elevation: 0
    ),
    iconTheme: const IconThemeData(
      color:white,
      size:30
    ),
    textTheme:const TextTheme(
      titleSmall:TextStyle(
        color: white
      ),
    )
  );
  void changeTheme(ThemeMode mode)async{
    SharedPreferences prefs = await prefs_;
    prefs.setString("theme",mode.toString()); 
    themeMode=mode;
    notifyListeners();
  }
}