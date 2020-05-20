import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 布局包
import 'package:flutter_rush/utils/global_utils.dart';
import 'package:image_picker/image_picker.dart'; // 选择图片
import 'package:flutter_rush/widgets/mine/drawer.dart';

class MinePage extends StatefulWidget {
  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<MinePage> {
  @override
  void dispose() {
    // 销毁生命周期
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    // TODO: implement build
    return Scaffold(
      drawer: MyDrawer(), //抽屉
      appBar: AppBar(title: Text("纹身店铺"), backgroundColor: Colors.white),
      body: ListView(
        children: <Widget>[
          HeadImageWidget(),
          UserInfoWidget(),
          FeatureListWidget(),
          FansWidget()
        ],
      ),
      floatingActionButton: CameraWidget(),
    );
  }
}

// 头部头像
class HeadImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          width: GlobalUtils.calcScreenWidth(),
          child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(100),
              //   child: Image(
              //       image: NetworkImage(
              //           "https://fop-hotcamp-resource.rjfittime.com/157924504808506535668586667189"),
              //       width: 100,
              //       height: 100),
              // ),
              ClipOval(
                // 圆形头像
                child: Image(
                    image: NetworkImage(
                        "https://fop-hotcamp-resource.rjfittime.com/157924504808506535668586667189"),
                    width: 100,
                    height: 100),
              ),
              Expanded(
                  // 名字占比1
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(20.0), //容器内补白
                    child: Text(
                      "Hello world发克利夫兰法拉利开发看来发!",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  )),
            ],
          ),
        )
      ],
    );
    // return Text('王洪魁');
  }
}

// button 和 用户介绍
class UserInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: GlobalUtils.calcScreenWidth(),
          // decoration: BoxDecoration(border: Border.fromBorderSide(side)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 32.0,
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: Center(
                      child: Text(
                        '关注',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // decoration: BoxDecoration(),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 32.0,
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          'Requestt Consultation',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(255, 255, 255, 1)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text('Tattooer Cat Lover Chinese'),
              ),
            ],
          ),
        ),
        Container(
          width: GlobalUtils.calcScreenWidth(),
          height: ScreenUtil.getInstance().setHeight(20),
          color: Color.fromRGBO(242, 242, 243, 1),
          margin: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(50)),
        )
      ],
    );

    // return Text('王洪魁');
  }
}

// 用户列表
class FeatureListWidget extends StatelessWidget {
  var list = [
    {"icon": Icons.person, "text": "个人档案"},
    {"icon": Icons.event_note, "text": "My bookings"},
    {"icon": Icons.chat_bubble_outline, "text": "消息"},
    {"icon": Icons.replay, "text": "消息提醒"},
    {"icon": Icons.library_music, "text": "Share profile"},
    {"icon": Icons.brightness_low, "text": "选项"},
  ];
  Widget gridBuild() {
    List<Widget> feature = [];
    Widget content;
    for (var item in list) {
      feature.add(Column(
        children: <Widget>[
          FeatureChildren(text: item['text'], icon: item['icon'])
        ],
      ));
    }
    content = Column(
      children: feature,
    );
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: gridBuild(),
    );
  }
}

class FeatureChildren extends StatelessWidget {
  FeatureChildren({Key key, this.text: '', this.icon: ''})
      : super(key: key); // 传参

  // 初始化入参
  final String text;
  final icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Color.fromRGBO(242, 242, 243, 1),
      ))),
      margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil.getInstance().setWidth(40)),
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil.getInstance().setHeight(30),
      ),
      child: Flex(
        direction: Axis.horizontal, // flex 水平
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin:
                EdgeInsets.only(right: ScreenUtil.getInstance().setHeight(30)),
            child: Center(
              child: Icon(
                icon,
                size: 30,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              text,
              style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(32),
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}

// camera
class CameraWidget extends StatefulWidget {
  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.photo_camera),
      heroTag: null,
      onPressed: () {
        // var image = ImagePicker.pickImage(source: ImageSource.camera); // 真机测试闪退
        var image = ImagePicker.pickImage(source: ImageSource.gallery);
        print('FloatingActionButton');
      },
    );
  }
}

// fans
class FansWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        width: GlobalUtils.calcScreenWidth(),
        height: ScreenUtil.getInstance().setHeight(20),
        color: Color.fromRGBO(242, 242, 243, 1),
      ),
      Container(
        width: GlobalUtils.calcScreenWidth(),
        padding: EdgeInsets.symmetric(
            vertical: ScreenUtil.getInstance().setHeight(30)),
        margin: EdgeInsets.symmetric(
            horizontal: ScreenUtil.getInstance().setWidth(40)),
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Text(
                    '22',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('上传')
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Text(
                    '156',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('粉丝')
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Text(
                    '10',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('正在关注')
                ],
              ),
            )
          ],
        ),
      ),
      Container(
        width: GlobalUtils.calcScreenWidth(),
        height: ScreenUtil.getInstance().setHeight(20),
        color: Color.fromRGBO(242, 242, 243, 1),
      ),
    ]);
  }
}
