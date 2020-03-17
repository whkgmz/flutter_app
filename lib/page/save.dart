import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 布局包
import 'package:flutter_rush/utils/global_utils.dart';
import 'package:flutter_rush/widgets/save/save_header.dart';

class SaveWidget extends StatefulWidget {
  @override
  _SaveWidgetState createState() => _SaveWidgetState();
}

class _SaveWidgetState extends State<SaveWidget>
    with SingleTickerProviderStateMixin {
  TabController _tabController; //需要定义一个Controller
  List tabs = ["纹身", "纹身师", "工作室"];
  List tabsView = [TattooView(), TattooArtist(), TattooStudio()];

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController =
        TabController(length: tabs.length, vsync: ScrollableState());
  }

  /**
   * 下拉刷新,必须异步async不然会报错
   */
  Future _pullToRefresh() async {
    print('王洪魁');
  }

  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil.getInstance().setWidth(40)),
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            SaveHeaderWidget(),
            Container(
              margin:
                  EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(40)),
              child: TabBar(
                  //生成Tab菜单
                  unselectedLabelColor: Color.fromRGBO(24, 25, 29, 1),
                  labelColor: Color.fromRGBO(255, 124, 148, 1),
                  indicatorColor: Color.fromRGBO(255, 124, 148, 1),
                  controller: _tabController,
                  tabs: tabs.map((e) => Tab(text: e)).toList()),
            ),
            Expanded(
              flex: 1,
              child: TabBarView(
                controller: _tabController,
                children: tabsView.map((e) {
                  //创建3个Tab页
                  return RefreshIndicator(
                    color: const Color(0xFF4483f6),
                    child: ListView(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          child: e,
                        ),
                      ],
                    ),
                    onRefresh: _pullToRefresh,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 以下三个组件可以是同一个组件，还未写成公共
// // 纹身tab view
class TattooView extends StatefulWidget {
  @override
  _TattooViewState createState() => _TattooViewState();
}

class _TattooViewState extends State<TattooView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Get inspired!',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil.getInstance().setSp(40)),
            ),
            Container(
              padding: EdgeInsets.only(left: 40, right: 40),
              margin:
                  EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(15)),
              child: Text(
                'Save your favoritet artists so you can book with them in the future',
                style: TextStyle(
                  color: Color.fromRGBO(140, 143, 151, 1),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Listener(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.only(
                    top: ScreenUtil.getInstance().setHeight(45)),
                padding: EdgeInsets.only(
                    top: ScreenUtil.getInstance().setHeight(25),
                    bottom: ScreenUtil.getInstance().setHeight(25)),
                child: Center(
                  child: Text(
                    'Browse tattoos',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: ScreenUtil.getInstance().setSp(30)),
                  ),
                ),
              ),
              onPointerDown: (PointerDownEvent event) => print('我很快'),
            )
          ],
        ),
      ),
    );
  }
}

// 纹身师tab view
class TattooArtist extends StatefulWidget {
  @override
  _TattooArtistState createState() => _TattooArtistState();
}

class _TattooArtistState extends State<TattooArtist> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Connect width local artists',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil.getInstance().setSp(40)),
            ),
            Container(
              padding: EdgeInsets.only(left: 40, right: 40),
              margin:
                  EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(15)),
              child: Text(
                'Save your favoritet artists so you can book with them in the future',
                style: TextStyle(
                  color: Color.fromRGBO(140, 143, 151, 1),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Listener(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.only(
                    top: ScreenUtil.getInstance().setHeight(45)),
                padding: EdgeInsets.only(
                    top: ScreenUtil.getInstance().setHeight(25),
                    bottom: ScreenUtil.getInstance().setHeight(25)),
                child: Center(
                  child: Text(
                    'Browse artists',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: ScreenUtil.getInstance().setSp(30)),
                  ),
                ),
              ),
              onPointerDown: (PointerDownEvent event) => print('我很快'),
            )
          ],
        ),
      ),
    );
  }
}

// 工作室 tab view
class TattooStudio extends StatefulWidget {
  @override
  _TattooStudioState createState() => _TattooStudioState();
}

class _TattooStudioState extends State<TattooStudio> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'World is best studios',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil.getInstance().setSp(40)),
            ),
            Container(
              padding: EdgeInsets.only(left: 40, right: 40),
              margin:
                  EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(15)),
              child: Text(
                'Save your favoritet studios so you can book with them in the future',
                style: TextStyle(
                  color: Color.fromRGBO(140, 143, 151, 1),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Listener(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.only(
                    top: ScreenUtil.getInstance().setHeight(45)),
                padding: EdgeInsets.only(
                    top: ScreenUtil.getInstance().setHeight(25),
                    bottom: ScreenUtil.getInstance().setHeight(25)),
                child: Center(
                  child: Text(
                    'Browse studios',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: ScreenUtil.getInstance().setSp(30)),
                  ),
                ),
              ),
              onPointerDown: (PointerDownEvent event) => print('工作室'),
            )
          ],
        ),
      ),
    );
  }
}
