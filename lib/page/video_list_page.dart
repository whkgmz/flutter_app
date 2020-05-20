import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 布局包
import 'package:flutter_rush/utils/global_utils.dart';
import 'package:flutter_rush/routers/router_util.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rush/provide/video_provider_model.dart';
import 'package:flutter_rush/network/apis.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';

class VideoListPage extends StatefulWidget {
  @override
  _VideoListPageState createState() => _VideoListPageState();
}

Future getVideoList() async {
  Completer completer = new Completer();
  return await ApiUtil().requestVideoList({
    "applyId": "68198",
    "userId": "12071380",
    "date": "2020-04-15",
    "athleticAbilityLevel": "A0",
    "campStartTime": "2020-03-30",
    "currentDay": 17
  }).then((onValue) {
    if (onValue.retcode == 200) {
      //return onValue;
      print(onValue);
      completer.complete(onValue.retcode);
      // return onValue.object.sportList;
    } else {
      Fluttertoast.showToast(
          msg: "${onValue.retdesc}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1);
    }
  });
}

class _VideoListPageState extends State<VideoListPage> {
  List formList;
  //@override
  initState() {
    super.initState();
    // getVideoList().then((onValue) {
    //   print(onValue);
    //   Provider.of<VideoProviderModel>(context, listen: false)
    //       .setVideoListData(onValue);
    // });
  }

  Widget _buildListView() {
    List<Widget> videos = []; //先建一个数组用于存放循环生成的widget
    Widget content; //单独一个widget组件，用于返回需要生成的内容widget
    formList = [
      {
        "url":
            'https://fop-hotcamp-resource.rjfittime.com/project/1583813406191.mp4',
        "displayName": "俯卧位呼吸",
        "imageUrl":
            "https://fop-hotcamp-resource.rjfittime.com/0003_image_FuWoWeiHuXi-Jiu.png"
      },
      {
        "url":
            'https://fop-hotcamp-resource.rjfittime.com/project/1583825445230.mp4',
        "displayName": "仰卧位呼吸",
        "imageUrl":
            "https://fop-hotcamp-resource.rjfittime.com/0007_image_YangWoWeiHuXi-Jiu.png"
      },
      {
        "url":
            'https://fop-hotcamp-resource.rjfittime.com/0008_follow1_ZhanZiKaiGeEr-Jiu.mp4',
        "displayName": "站姿凯格尔",
        "imageUrl":
            "https://fop-hotcamp-resource.rjfittime.com/0008_image_ZhanZiKaiGeEr-Jiu.png"
      },
      {
        "url":
            'https://fop-hotcamp-resource.rjfittime.com/0009_follow1_ZuoZiKaiGeEr-Jiu.mp4',
        "displayName": "坐姿凯格尔",
        "imageUrl":
            "https://fop-hotcamp-resource.rjfittime.com/0009_image_ZuoZiKaiGeEr-Jiu.png"
      },
      {
        "url":
            'https://fop-hotcamp-resource.rjfittime.com/0115_follow1_ZuoYouCeSanJiaoJiHouShuLaShen.mp4',
        "displayName": "三角肌后束拉伸（左/右)",
        "imageUrl":
            "https://fop-hotcamp-resource.rjfittime.com/0115_image_ZuoYouCeSanJiaoJiHouShuLaShen.jpg"
      },
      {
        "url":
            'https://fop-hotcamp-resource.rjfittime.com/0161_follow1_ZuoYouCeXieFangJiLaShen.mp4',
        "displayName": "斜方肌拉伸（左/右）",
        "imageUrl":
            "https://fop-hotcamp-resource.rjfittime.com/0161_image_ZuoYouCeXieFangJiLaShen.jpg"
      },
    ];
    if (formList != null) {
      for (var item in formList) {
        videos.add(
          GestureDetector(
            onTap: () => {
              NavigatorUtils.push(
                  context, "/videoPlay?url=${Uri.encodeComponent(item['url'])}")
            },
            child: Container(
              height: 100,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        right: ScreenUtil.getInstance().setWidth(20)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    child: Image(
                      image: NetworkImage(item["imageUrl"]),
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
                            item["displayName"],
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: ScreenUtil.getInstance().setHeight(10)),
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Text('1X32'),
                                margin: EdgeInsets.only(
                                    right:
                                        ScreenUtil.getInstance().setWidth(30)),
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
          ),
        );
      }
    }

    content = ListView(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil.getInstance().setWidth(40)),
      children: videos,
    );
    return content;
  }

  @override
  Widget build(BuildContext context) {
    print(Provider.of<VideoProviderModel>(context).count);
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        // ),
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
                // child: ListView(
                //   children: <Widget>[_buildListView()],
                // ),
                child: _buildListView(),
                // child: ListView(
                //   // shrinkWrap: true,
                //   padding: EdgeInsets.symmetric(
                //       horizontal: ScreenUtil.getInstance().setWidth(40)),
                //   children: <Widget>[
                //     Container(
                //       height: 100,
                //       child: Row(
                //         children: <Widget>[
                //           Container(
                //             margin: EdgeInsets.only(
                //                 right: ScreenUtil.getInstance().setWidth(20)),
                //             decoration: BoxDecoration(
                //                 borderRadius:
                //                     BorderRadius.all(Radius.circular(4))),
                //             child: Image(
                //               image:
                //                   AssetImage("assets/images/video/girl.jpeg"),
                //               fit: BoxFit.cover,
                //               width: ScreenUtil.getInstance().setHeight(210),
                //               height: ScreenUtil.getInstance().setHeight(130),
                //             ),
                //           ),
                //           Expanded(
                //             flex: 1,
                //             child: Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: <Widget>[
                //                 Container(
                //                   width: GlobalUtils.calcScreenWidth(),
                //                   child: Text(
                //                     '泡轴胸部放松-左',
                //                     textAlign: TextAlign.start,
                //                   ),
                //                 ),
                //                 Container(
                //                   margin: EdgeInsets.only(
                //                       top: ScreenUtil.getInstance()
                //                           .setHeight(10)),
                //                   child: Row(
                //                     children: <Widget>[
                //                       Container(
                //                         child: Text('1X32'),
                //                         margin: EdgeInsets.only(
                //                             right: ScreenUtil.getInstance()
                //                                 .setWidth(30)),
                //                       ),
                //                       Text('休息 0')
                //                     ],
                //                   ),
                //                 )
                //               ],
                //             ),
                //           ),
                //           Icon(
                //             Icons.keyboard_arrow_right,
                //             color: Color.fromRGBO(210, 210, 211, 1),
                //           ),
                //         ],
                //       ),
                //     ),
                //     // _buildListView()
                //   ],
                // ),
              ),
              Container(height: ScreenUtil.getInstance().setHeight(128))
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
                  color: Color.fromRGBO(229, 229, 229, 1),
                ))),
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
                                    Icons.cloud_download,
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
                                    Icons.star_border,
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
                                    Icons.fingerprint,
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
                                          Icons.play_circle_outline,
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
                            onTap: () => {
                                  NavigatorUtils.push(context,
                                      "/videoPlay?url=${Uri.encodeComponent('')}")
                                })
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
