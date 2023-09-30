import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
class PaletteListProvider extends ChangeNotifier{
  Future<SharedPreferences> prefs_ = SharedPreferences.getInstance();
  List<String>paletteList = [];
  PaletteListProvider(){
    prefs_.then((SharedPreferences prefs){
      paletteList = prefs.getStringList('colorList')??[];
      notifyListeners();
      }
    );
  }
  void addPalette(String color){
    if(paletteList.length<30){
      paletteList.add(color);
      saveList();
      notifyListeners();
    }
  }
  void editPalette(int index,String newColor){
    paletteList[index] = newColor;
    saveList();
    notifyListeners();
  }
  void removePalette(int index){
    paletteList.removeAt(index);
    saveList();
    notifyListeners();
  }
  void saveList()async{
    final SharedPreferences prefs = await prefs_;
    prefs.setStringList("colorList", paletteList);
  }
}