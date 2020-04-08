import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 布局包
import 'package:flutter_rush/utils/global_utils.dart';
import 'package:flutter_rush/routers/router_util.dart';

class VideoListPage extends StatefulWidget {
  @override
  _VideoListPageState createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Container(
                height: ScreenUtil.getInstance().setHeight(510),
                width: GlobalUtils.calcScreenWidth(),
                decoration: BoxDecoration(
                  image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/video/girl.jpeg'),
                  ),
                ),
                child: Container(
                  height: ScreenUtil.getInstance().setHeight(510),
                  width: GlobalUtils.calcScreenWidth(),
                  padding: EdgeInsets.only(
                      bottom: ScreenUtil.getInstance().setHeight(40)),
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            bottom: ScreenUtil.getInstance().setHeight(70)),
                        child: Text(
                          '三角肌后束训练技巧',
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: ScreenUtil.getInstance().setSp(48),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  '24',
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontSize:
                                          ScreenUtil.getInstance().setSp(40),
                                      fontWeight: FontWeight.w600),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Minutes',
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontSize:
                                            ScreenUtil.getInstance().setSp(28)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  '17',
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontSize:
                                          ScreenUtil.getInstance().setSp(40),
                                      fontWeight: FontWeight.w600),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Rounds',
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontSize:
                                            ScreenUtil.getInstance().setSp(28)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'EASY',
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontSize:
                                          ScreenUtil.getInstance().setSp(40),
                                      fontWeight: FontWeight.w600),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Level',
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontSize:
                                            ScreenUtil.getInstance().setSp(28)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: GlobalUtils.calcScreenWidth(),
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil.getInstance().setWidth(40)),
                margin: EdgeInsets.symmetric(
                    vertical: ScreenUtil.getInstance().setWidth(40)),
                child: Text(
                  '17个动作  约42分钟',
                  style: TextStyle(
                      color: Color.fromRGBO(66, 69, 80, 1),
                      fontSize: ScreenUtil.getInstance().setSp(24)),
                ),
              ),
              Expanded(
                child: ListView(
                  // shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil.getInstance().setWidth(40)),
                  children: <Widget>[
                    Container(
                      height: 100,
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                right: ScreenUtil.getInstance().setWidth(20)),
                            child: Image(
                              image:
                                  AssetImage("assets/images/video/girl.jpeg"),
                              fit: BoxFit.cover,
                              width: ScreenUtil.getInstance().setHeight(210),
                              height: ScreenUtil.getInstance().setHeight(130),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: GlobalUtils.calcScreenWidth(),
                                  child: Text(
                                    '泡轴胸部放松-左',
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: ScreenUtil.getInstance()
                                          .setHeight(10)),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        child: Text('1X32'),
                                        margin: EdgeInsets.only(
                                            right: ScreenUtil.getInstance()
                                                .setWidth(30)),
                                      ),
                                      Text('休息 0')
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Color.fromRGBO(210, 210, 211, 1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: Container(
                width: GlobalUtils.calcScreenWidth(),
                height: ScreenUtil.getInstance().setHeight(125),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            width: 1,
                            color: Color.fromRGBO(229, 229, 229, 1)))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  //left: ScreenUtil.getInstance().setWidth(40),
                                  right: ScreenUtil.getInstance().setWidth(25)),
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.error,
                                    color: Colors.green,
                                    size: 26,
                                  ),
                                  Text(
                                    '下载',
                                    style: TextStyle(
                                        color: Color.fromRGBO(102, 102, 102, 1),
                                        fontSize:
                                            ScreenUtil.getInstance().setSp(18)),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: ScreenUtil.getInstance().setWidth(25)),
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.error,
                                    color: Colors.green,
                                    size: 26,
                                  ),
                                  Text(
                                    '收藏',
                                    style: TextStyle(
                                        color: Color.fromRGBO(102, 102, 102, 1),
                                        fontSize:
                                            ScreenUtil.getInstance().setSp(18)),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: ScreenUtil.getInstance().setWidth(25)),
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.error,
                                    color: Colors.green,
                                    size: 26,
                                  ),
                                  Text(
                                    '点赞',
                                    style: TextStyle(
                                        color: Color.fromRGBO(102, 102, 102, 1),
                                        fontSize:
                                            ScreenUtil.getInstance().setSp(18)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                            child: Container(
                                width: ScreenUtil.getInstance().setWidth(480),
                                height: ScreenUtil.getInstance().setHeight(88),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(45),
                                    gradient: LinearGradient(
                                        // 线性渐变
                                        colors: [
                                          Color.fromRGBO(96, 170, 245, 1),
                                          Color.fromRGBO(124, 185, 249, 1)
                                        ])),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: ScreenUtil.getInstance()
                                                .setWidth(12)),
                                        child: Icon(
                                          Icons.error,
                                          color: Colors.white,
                                          size: 26,
                                        ),
                                      ),
                                      Text(
                                        '开始训练',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1),
                                            fontSize: ScreenUtil.getInstance()
                                                .setSp(32),
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                )),
                            onTap: () =>
                                {NavigatorUtils.push(context, 'videoPlay')})
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ],
    ));
  }
}
