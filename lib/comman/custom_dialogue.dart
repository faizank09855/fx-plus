import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'string_value.dart';
class CustomColorDialogue extends StatefulWidget {
  final Function onTap;
  const CustomColorDialogue({Key? key ,required this.onTap}) : super(key: key);

  @override
  State<CustomColorDialogue> createState() => _CustomColorDialogueState();
}

class _CustomColorDialogueState extends State<CustomColorDialogue> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  const Text(StringFiles.pickColor),
      content: SingleChildScrollView(
        child: ColorPicker(displayThumbColor: true,
          hexInputBar: false,

          portraitOnly: false,
          pickerColor: pickerColor,
          onColorChanged: changeColor,
               ),
      ),
      actions: <Widget>[
        ElevatedButton(
          child: const Text(StringFiles.gotIt),
          onPressed: ()=> widget.onTap(pickerColor),
        ),
      ],
    );
  }
  Color pickerColor = const Color(0xff443a49);
  Color currentColor = const Color(0xff443a49);

  void changeColor(Color color) {
    pickerColor = color;
  }
}


