import 'package:color_picker/widgets/bottomSheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import '../widgets/palette_list.dart';
import '../providers/palette_list_provider.dart';
import '../providers/color_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/theme_dialog.dart';
import '../utils/extensions.dart';
import '../widgets/bottomSheet/sheet_content.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    ColorProvider colorProvider = Provider.of<ColorProvider>(context,listen:false);
    return Scaffold(
      appBar:AppBar(
        title:const Text(
          "Palettes"
        ),
        actions:[
          IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: ()=>showD(context,false),
            icon:Icon(
              Icons.palette_outlined,
              color: Theme.of(context).iconTheme.color,
              size:40
            )
          ),
          10.horizontal,
          IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: (){
              colorProvider.resetColors();
              showSheet(context, child: const SheetContent());
            },
            icon:Icon(
              Icons.add,
              color: Theme.of(context).iconTheme.color,
              size:40
            )
          ),
          10.horizontal,
        ]
      ),
      body:Padding(
        padding:const EdgeInsets.symmetric(horizontal: 20,vertical:10),
        child: Consumer<PaletteListProvider>(
          builder:(context,paletteListProv,child)=>
            paletteListProv.paletteList.isNotEmpty?
            PaletteList(
              paletteList: paletteListProv.paletteList,
              paletteListProvider: paletteListProv,
              colorProvider: colorProvider,
            ):Center(
              child: Text(
                "No Palettes Added",
                style:TextStyle(
                  color:Theme.of(context).textTheme.titleSmall!.color,
                  fontSize:20,
                  fontWeight: FontWeight.w500
                )
              ),
            )
          
        )
      )
    );
  }
}