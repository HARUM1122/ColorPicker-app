import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier{
  int currentPageIndex = 0;
  void changePage(PageController controller,int index){
    if(index!=currentPageIndex){
      controller.jumpToPage(index);
      currentPageIndex = index;
      notifyListeners();
    }
  }
}