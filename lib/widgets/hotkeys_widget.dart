import 'package:flutter/material.dart';
import 'package:flutter_rush/model/hot_keys.dart';
import 'package:flutter_rush/network/http_utils.dart';
import 'package:flutter_rush/utils/global_utils.dart';

class HotKeyWidget extends StatefulWidget {

  @override
  _HotKeyWidgetState createState() => _HotKeyWidgetState();
}

class _HotKeyWidgetState extends State<HotKeyWidget> {
  var _future;

  @override
  void initState() {
    super.initState();
    print("hot key initState");
    _future = HttpUtils().requestHotKeys();
  }

  @override
  Widget build(BuildContext context) {
    print("hot key build");

    return FutureBuilder<List<HotKeys>>(
      future: _future,
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.done) {
          if (snap.hasError) {
            return Container();
          } else {
            return Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Hot Keys",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    margin: EdgeInsets.all(
                        GlobalUtils.calcWidgetHeightMultiple(0.015)),
                  ),
                  Container(
                    width: GlobalUtils.calcScreenWidth(),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: snap.data.length,
                      itemBuilder: (context, index) => _buildItem(snap.data[index]),
                      scrollDirection: Axis.horizontal,
                    ),
                    height: GlobalUtils.calcWidgetHeightMultiple(0.1),
                  )
                ],
              ),
              constraints: new BoxConstraints.loose(new Size(
                  GlobalUtils.calcScreenWidth(),
                  GlobalUtils.calcWidgetHeightMultiple(0.2))),
            );
          }
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildItem(HotKeys model) {
//    print("size    ${_hotKeys.length}");
    return Card(
      margin: EdgeInsets.all(9),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14.0))),
      clipBehavior: Clip.hardEdge,
      child: Container(
        child: Center(
          child: Text(
            model.name.trim(),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        width: GlobalUtils.calcWidgetWidthMultiple(0.25),
      ),
    );
  }
}
