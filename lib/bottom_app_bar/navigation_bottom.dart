import 'package:flutter/material.dart';
import 'package:pixel1/comman/custom_dialogue.dart';

import 'bottom_main.dart';
import 'icon_bottom_appbar.dart';

class BottomNavBar extends StatefulWidget {
final Function onTap ;
  const BottomNavBar({Key? key,required this.onTap,}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottamNavBarState();
}

class _BottamNavBarState extends State<BottomNavBar> {
  int styleNo = 0 ;
  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      children: [
        BottomAppBarMain(
          onTap: (index, value) {
            if (index == 2) {
              return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomColorDialogue(onTap: (pickedColor) {
                    Navigator.of(context).pop();
                  });
                },
              );
            }

          styleNo = index ;
          },
        ),
        IconBottomAppbar(onTap: (index) {
          setState(() {
            if (index == 0) {
              setState(() {
                styleNo = index;
              });
              return;
            }
            // controllerList.add(TextEditingController());
            // controllerList.last.text = "Text";
            // widgetTree.add(
            //   WidgetModel(text: index, dx: 10, dy: 10, type: "icon"),
            // );
          });
        }),
        IconBottomAppbar3(
            onFilterChanged: (Color value) => widget.onTap(value)),
        IconBottomAppbar2(
          onFilterChanged: (Color value) => setState((){widget.onTap(value);}),
        ),
      ],
      index: styleNo,
    );
  }


}
