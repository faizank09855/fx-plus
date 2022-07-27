import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorBottomAppbar extends StatefulWidget {


  const ColorBottomAppbar({Key? key, }) : super(key: key);

  @override
  State<ColorBottomAppbar> createState() => _ColorBottomAppbarState();
}

class _ColorBottomAppbarState extends State<ColorBottomAppbar> {
  List textStyleList = [
    Icons.map,
    Icons.add,
    Icons.access_alarm,
    Icons.label,
    Icons.accessibility,
    Icons.account_balance_wallet_sharp,
    Icons.account_circle_outlined,
    Icons.zoom_out_rounded,
    Icons.wrong_location_sharp,
    Icons.ad_units_outlined,
    Icons.mobile_friendly,
    Icons.wb_sunny
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: 64,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: IconButton(
                icon: const Icon(Icons.cancel),
                onPressed: () {

                },
              ),
            ),
            Expanded(
              flex: 6,  child:  BlockPicker(
              itemBuilder: (color, isCurrentColor, changeColor) =>
              Container(color: color, height: 20, width: 20,),
              pickerColor: pickerColor,
              onColorChanged: changeColor,

            //   enableLabel: true, // only on portrait mode
            )
            // ListView.builder(
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     itemCount: textStyleList.length,
              //     itemBuilder: (ctx, index) {
              //       return Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 4.0),
              //         child: InkWell(
              //
              //           onTap: () => widget.onTap(textStyleList[index]),
              //           child: Material(
              //             elevation: 3,
              //             shape: const CircleBorder(),
              //             child: Ink(
              //               padding: const EdgeInsets.all(6),
              //               child:
              //               Center(child: Icon(textStyleList[index])),
              //             ),
              //           ),
              //         ),
              //       );
              //     }),
            ),
          ],
        ),
      ),
    );
  }

  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }
}
