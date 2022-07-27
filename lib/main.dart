import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'bottom_app_bar/navigation_bottom.dart';
import 'comman/string_value.dart';
import 'comman/widget_model.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ImagePicker _picker = ImagePicker();
File? file;
  final String image =
      "https://www.pixelstalk.net/wp-content/uploads/2016/07/Free-Sunrise-Image-Download-768x480.jpg";
  double width = 20;
  final _filters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
      (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    )
  ];
 ValueNotifier<Color> _filterColor = ValueNotifier<Color>(Colors.white);
  List<WidgetModel> widgetTree = [];
  List dy = [];
  List dx = [];
  List<TextEditingController> controllerList = [];
  List textStyleList = [
    const TextStyle(fontSize: 16),
    const TextStyle(
        fontSize: 14, color: Colors.red, fontWeight: FontWeight.bold),
    const TextStyle(
        fontSize: 12,
        color: Colors.green,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic),
  ];
  int styleNo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [IconButton(onPressed: ()
        async{

        PickedFile? pickerFile = await  _picker.getImage(source: ImageSource.gallery) ;
setState(() {
  file = File(pickerFile!.path);
});



        },icon: const Icon(Icons.add),)],),
        body: _body(),
        floatingActionButton: _floatingActionButton(),
        bottomNavigationBar: BottomNavBar(
          onTap: () => onIconButton2tap,
        ));
  }

  _onTap() {
    setState(() {
      controllerList.add(TextEditingController());
      controllerList.last.text = "Text";
      widgetTree.add(WidgetModel(
          text: controllerList.last, dx: 10, dy: 10, type: StringFiles.text));
    });
  }

  _body() {
    return Column(
      children: [
        InteractiveViewer(
          child: Stack(
            children: [
              _backgroundImage(),
              if (widgetTree.isNotEmpty)
                for (int i = 0; i < widgetTree.length; i++) _itemsList(i),
            ],
          ),
        ),
      ],
    );
  }

  _itemsList(int i) {
    return Positioned(
      left: widgetTree[i].dx,
      top: widgetTree[i].dy,
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          setState(() {
            widgetTree[i].dx = details.globalPosition.dx;
            widgetTree[i].dy = details.globalPosition.dy -
                MediaQuery.of(context).size.height * 0.12;
          });
        },
        onHorizontalDragUpdate: (details) {
          setState(() {
            widgetTree[i].dx = details.globalPosition.dx;
            widgetTree[i].dy = details.globalPosition.dy -
                MediaQuery.of(context).size.height * 0.12;
          });
        },
        child: widgetTree[i].type == StringFiles.text
            ? Row(children: [
                SizedBox(
                  width: width + 20,
                  child: TextField(
                    controller: widgetTree[i].text,
                    style: TextStyle(fontSize: width / 2.2),
                    decoration: const InputDecoration(
                        counterStyle: TextStyle(color: Colors.blue),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.transparent),
                  ),
                ),
                GestureDetector(
                  onVerticalDragUpdate: (details) {
                    setState(() {
                      width = details.localPosition.distance;
                    });
                  },
                  child: const Icon(
                    Icons.zoom_out_map,
                    size: 16,
                  ),
                )
              ])
            : SizedBox(
                width: 100 + width,
                height: 40 + width,
                child: Icon(widgetTree[i].text)),
      ),
    );
  }

  _backgroundImage() {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: file == null ?  Container(
          child: ValueListenableBuilder(
            valueListenable: _filterColor,
            builder: (context, value, child) {
              final color = value as Color;
              return Container(
                  height: 100, width: double.infinity, color: Colors.blue);
            },
          ),
          color: Colors.blue,
          width: double.infinity,
        ) :
        Image.file(file!)

    );
  }

  onIconButton2tap(value) {
    setState(() {
      _filterColor.value = value;
    });
  }

  _floatingActionButton() {
    return FloatingActionButton(onPressed: () async {
      _onTap();
    });
  }
}
