import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pixel1/comman/color_filter_custom.dart';

class BottomAppBarMain extends StatefulWidget {
  final Function onTap;

  const BottomAppBarMain({Key? key, required this.onTap}) : super(key: key);

  @override
  State<BottomAppBarMain> createState() => _BottomAppBarMainState();
}

class _BottomAppBarMainState extends State<BottomAppBarMain> {
  List wrapList = const [
    Icon(Icons.edit),
    Icon(Icons.camera),
    Icon(Icons.wb_sunny_outlined),
    Icon(Icons.crop),
    Icon(Icons.camera),
    Icon(Icons.wb_sunny_outlined),
    Icon(Icons.crop),
    Icon(Icons.crop),
  ];
  final _filterColor = ValueNotifier<Color>(Colors.white);
  final _filters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
      (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    )
  ];

  List list = [];

  @override
  void initState() {
    list = [
        IconButton(
      icon: const Icon(Icons.photo_library_outlined),
      onPressed: () {
        Scaffold.of(context).showBottomSheet((cnt) => Container(
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2)),
          height: MediaQuery.of(cnt).size.height * 0.1,
          width: MediaQuery.of(cnt).size.width,
          child: ListView.builder(
            itemCount: wrapList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) => SizedBox(
              height: MediaQuery.of(cnt).size.height * 0.1,
              width: MediaQuery.of(cnt).size.width * 0.17,
              child: wrapList[index],
            ),
          ),
        ));
      },
    ),
         Icon(Icons.text_fields),
         Icon(Icons.color_lens),
         Icon(Icons.edit)];
  }

  @override
  Widget build(BuildContext context) {

    return BottomAppBar(
      elevation: 0,
      child: SizedBox(
        height: 64,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (ctx, index) {
              return InkWell(
                onTap: () => widget.onTap(index, _filterColor),
                child: Container(
                    color: Colors.cyan,
                    padding: const EdgeInsets.all(6),
                    margin: const EdgeInsets.all(6),
                    child: Center(
                      child: list[index],
                    )),
              );
            }),
      ),
    );
  }
}
