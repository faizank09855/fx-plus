import 'package:flutter/material.dart';
import 'package:pixel1/comman/color_filter_custom.dart';
import 'package:pixel1/comman/custom_dialogue.dart';

class IconBottomAppbar extends StatefulWidget {
  final Function onTap;

  const IconBottomAppbar({Key? key, required this.onTap}) : super(key: key);

  @override
  State<IconBottomAppbar> createState() => _IconBottomAppbarState();
}

class _IconBottomAppbarState extends State<IconBottomAppbar> {
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
                  widget.onTap(0);
                },
              ),
            ),
            Expanded(
              flex: 6,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: textStyleList.length,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: InkWell(

                        onTap: () => widget.onTap(textStyleList[index]),
                        child: Material(
                          elevation: 3,
                          shape: const CircleBorder(),
                          child: Ink(
                            padding: const EdgeInsets.all(6),
                            child:
                                    Center(child: Icon(textStyleList[index])),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}


class IconBottomAppbar2 extends StatefulWidget {
  final Function onFilterChanged;

  const IconBottomAppbar2({Key? key, required this.onFilterChanged}) : super(key: key);

  @override
  State<IconBottomAppbar2> createState() => _IconBottomAppbarState2();
}

class _IconBottomAppbarState2 extends State<IconBottomAppbar2> {
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
  var _filterColor = ValueNotifier<Color>(Colors.white);
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
elevation : 0,
      child: SizedBox(
        height: 64,
        child: FilterSelector(
          onFilterChanged: (value){widget.onFilterChanged(value);},
      filters: _filters,
    ) ,
      ),
    );
  }

  final _filters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
          (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    )
  ];
}


class IconBottomAppbar3 extends StatefulWidget {
  final Function onFilterChanged;

  const IconBottomAppbar3({Key? key, required this.onFilterChanged}) : super(key: key);



  @override
  State<IconBottomAppbar3> createState() => _IconBottomAppbarState3();
}



class _IconBottomAppbarState3 extends State<IconBottomAppbar3> {
 
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
  var _filterColor = ValueNotifier<Color>(Colors.white);
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
elevation : 0,
      child: SizedBox(
        height: 64,
        child: FilterSelector(
          onFilterChanged: (value){widget.onFilterChanged(value);},
      filters: _filters,
    ) ,
      ),
    );
  }

  final _filters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
          (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    )
  ];
}
