import 'package:flutter/material.dart';
import '../../providers/page_provider.dart';
import '../../constants/color_constants.dart';
class ChangePageButton extends StatelessWidget {
  final int pageIndex;
  final String title;
  final PageProvider pageProvider;
  final PageController controller;
  const ChangePageButton({
    required this.pageIndex,
    required this.title,
    required this.pageProvider,
    required this.controller,
    super.key
  });
  @override
  Widget build(BuildContext context) {
    bool selected = pageProvider.currentPageIndex==pageIndex;
    return Expanded(
      child: GestureDetector(
        onTap:()=>pageProvider.changePage(controller,pageIndex),
        child:Container(
          height:30,
          color:selected?const Color.fromRGBO(129, 77, 255,1):Theme.of(context).cardColor,
          child:Center(
            child: Text(
              title,
              style:TextStyle(
                color:selected?white:Theme.of(context).textTheme.titleSmall!.color,
                fontSize:14,
              )
            ),
          )
        )
      ),
    );
  }
}