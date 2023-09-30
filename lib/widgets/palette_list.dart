import 'package:color_picker/providers/color_provider.dart';
import 'package:flutter/services.dart';
import '../utils/extensions.dart';
import 'package:flutter/material.dart';
import '../providers/palette_list_provider.dart';
import 'bottomSheet/bottom_sheet.dart';
import 'bottomSheet/sheet_content.dart';
import 'custom_snackbar.dart';
import '../utils/hex_convertion.dart';
class PaletteList extends StatefulWidget {
  final List<String> paletteList;
  final PaletteListProvider paletteListProvider;
  final ColorProvider colorProvider;
  const PaletteList({
    required this.paletteList,
    required this.paletteListProvider,
    required this.colorProvider,
    super.key
  });
  @override
  State<PaletteList> createState() => PaletteListState();
}
class PaletteListState extends State<PaletteList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount:widget.paletteList.length,
      itemBuilder: (BuildContext context, int index)=>SizedBox(
        height:80,
        child: GestureDetector(
          onTap:()=>Clipboard.setData(ClipboardData(text:widget.paletteList[index])).whenComplete(
            ()=>showSnackBar_(context)
          ),
          child: Container(
            margin:const EdgeInsets.only(bottom:10),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              children: [
                Container(
                  margin:const EdgeInsets.only(left: 12),
                  height:20,
                  width:20,
                  decoration:BoxDecoration(
                    shape:BoxShape.circle,
                    color:hexToRgb(widget.paletteList[index]),
                  )
                ),
                12.horizontal,
                Text(
                  widget.paletteList[index],
                  style:Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize:22,
                    fontWeight: FontWeight.w500
                  )
                ),
                const Spacer(),
                IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed:(){
                    widget.colorProvider.hex = widget.paletteList[index];
                    widget.colorProvider.hexChanged();
                    showSheet(context, child:
                    SheetContent(index: index,)
                    );
                  },
                  icon:const Icon(
                    Icons.edit_outlined,
                  )
                ),
                IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed:()=>widget.paletteListProvider.removePalette(index),
                  icon:const Icon(
                    Icons.delete_outlined,
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}