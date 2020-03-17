import 'package:flutter/material.dart';
import 'package:flutter_rush/utils/global_utils.dart';

class DefaultTitle extends StatelessWidget {
  final String title;

  const DefaultTitle({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(GlobalUtils.calcWidgetHeightMultiple(0.015)),
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        title,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }
}
