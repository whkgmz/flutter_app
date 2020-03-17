import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 布局包
import 'package:flutter_rush/utils/global_utils.dart';

class SaveHeaderWidget extends StatefulWidget {
  @override
  _SaveHeaderWidgetState createState() => _SaveHeaderWidgetState();
}

class _SaveHeaderWidgetState extends State<SaveHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(80)),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.title,
                  size: 50,
                ),
                Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: ScreenUtil.getInstance().setWidth(70),
                          height: ScreenUtil.getInstance().setWidth(70),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(242, 242, 243, 1),
                              borderRadius: BorderRadius.circular(
                                  ScreenUtil.getInstance().setWidth(70))),
                          child: Icon(Icons.camera_alt),
                        ),
                        Container(
                          width: ScreenUtil.getInstance().setWidth(70),
                          height: ScreenUtil.getInstance().setWidth(70),
                          margin: EdgeInsets.only(
                              left: ScreenUtil.getInstance().setWidth(15)),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(
                                  ScreenUtil.getInstance().setWidth(70))),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: ScreenUtil.getInstance().setHeight(20)),
                  child: Text(
                    'Saved',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil.getInstance().setSp(50)),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
