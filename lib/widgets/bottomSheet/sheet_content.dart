import 'package:color_picker/providers/color_provider.dart';
import 'package:color_picker/providers/page_provider.dart';
import 'package:color_picker/providers/palette_list_provider.dart';
import '../../utils/hsv_convertion.dart';
import 'package:color_picker/widgets/bottomSheet/change_page_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/pages.dart';
class SheetContent extends StatefulWidget {
  final int? index;
  const SheetContent({
    this.index,
    super.key
  });
  @override
  State<SheetContent> createState() => SheetContentState();
}
class SheetContentState extends State<SheetContent> {
  @override
  Widget build(BuildContext context) {
    final PageProvider pageProvider = Provider.of<PageProvider>(context,listen:false);
    final PageController controller = PageController(initialPage:pageProvider.currentPageIndex);
    final PaletteListProvider paletteListProvider = Provider.of<PaletteListProvider>(context,listen:false);
    final ColorProvider colorPickerProvider = Provider.of<ColorProvider>(context,listen:false);
    return Container(
      height:MediaQuery.of(context).size.height/2.4,
      color:Theme.of(context).canvasColor,
      child:Column(
        children: [
          Consumer<PageProvider>(
            builder: (context,pageProv,child)=>Row(
              children: [
                ChangePageButton(controller:controller,pageIndex: 0, title: "Picker", pageProvider: pageProv),
                ChangePageButton(controller:controller,pageIndex: 1, title: "HEX", pageProvider: pageProv),
                ChangePageButton(controller:controller,pageIndex: 2, title: "HSV", pageProvider: pageProv),
                ChangePageButton(controller:controller,pageIndex: 3, title: "RGB", pageProvider: pageProv),
              ],
            ),
          ),
          Expanded(
            flex:8,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller,
              children: const [
                ColorPickerPage(),
                HexPage(),
                HsvPage(),
                RgbPage()
              ],
            )
          ),
          Padding(
            padding:const EdgeInsets.symmetric(horizontal: 16,vertical: 2),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: const ButtonStyle(
                      overlayColor: MaterialStatePropertyAll<Color>(Colors.transparent)
                    ),
                    onPressed: ()=>Navigator.pop(context),
                    child:Text(
                      "Cancel",
                      style:Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize:16
                      )
                    )
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height:45,      
                    child: ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(129, 77, 255,1),
                        shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                      onPressed: (){
                        widget.index==null?
                        paletteListProvider.addPalette(hsvToHex(colorPickerProvider.hsvColor)):
                        paletteListProvider.editPalette(widget.index!,hsvToHex(colorPickerProvider.hsvColor));
                        Navigator.pop(context);
                      },
                      child:Text(
                       widget.index==null?"Add Color":"Apply",
                       style:const TextStyle(
                        fontSize:16
                       )
                      )
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}