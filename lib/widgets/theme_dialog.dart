import 'package:flutter/material.dart';
import '../providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'custom_radio_button.dart';
showD(BuildContext context,bool isSecond){
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Theme.of(context).cardColor,
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child:SizedBox(
          height:MediaQuery.of(context).size.height/5,
          child:Padding(
            padding: const EdgeInsets.only(left:10),
            child: Consumer<ThemeProvider>(
              builder: (context,themeProv,child)=>
              Column(
                children: [
                  CustomRadio(title: "Light theme", pressed:()=> themeProv.changeTheme(ThemeMode.light), selected: themeProv.themeMode==ThemeMode.light),
                  const Spacer(),
                  CustomRadio(title: "Dark theme", pressed:()=> themeProv.changeTheme(ThemeMode.dark), selected: themeProv.themeMode==ThemeMode.dark),
                  const Spacer(),
                  CustomRadio(title: "Use system settings", pressed:()=> themeProv.changeTheme(ThemeMode.system), selected: themeProv.themeMode==ThemeMode.system),
                  const SizedBox(height:20)
                ],
              ),
            ),
          )
        )
      );
    }
  );
}