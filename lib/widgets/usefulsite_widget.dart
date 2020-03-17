import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rush/model/useful_site_entity.dart';
import 'package:flutter_rush/provide/useful_site_data.dart';
import 'package:flutter_rush/utils/global_utils.dart';
//import 'package:provide/provide.dart';

class UsefulSiteWidget extends StatefulWidget {
  final List<UsefulSiteEntity> initData;
  static const String TITLE = "Useful Site";

  const UsefulSiteWidget({Key key, this.initData}) : super(key: key);

  @override
  _UsefulSiteWidgetState createState() => _UsefulSiteWidgetState();
}

class _UsefulSiteWidgetState extends State<UsefulSiteWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("_UsefulSiteWidgetState");
    return Container(
        height: GlobalUtils.calcWidgetHeightMultiple(0.12),
//        child: Provide<UsefulSiteData>(
//          builder: (context, child, data) {
//            return ListView.builder(
//              physics: BouncingScrollPhysics(),
//              itemCount: data.usefulSite!=null?data.usefulSite.length:widget.initData.length,
//              itemBuilder: (context, index) =>
//                  _buildItem(data.usefulSite!=null?data.usefulSite[index]:widget.initData[index]),
//              scrollDirection: Axis.horizontal,
//            );
//          },
//        )
    );
  }

  Widget _buildItem(UsefulSiteEntity model) {

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
        width: GlobalUtils.calcWidgetWidthMultiple(0.5),
      ),
    );
  }
}
