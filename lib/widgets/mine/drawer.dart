import 'package:flutter/material.dart';
import 'package:flutter_rush/utils/shared_preferences.dart';
import 'package:flutter_rush/routers/router_util.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  static Future outLogin() async {
    SpUtils.clear();
  }

  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        //removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "更多设置",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  GestureDetector(
                    child: ListTile(
                      leading: const Icon(Icons.add),
                      title: const Text('退出登录'),
                    ),
                    onTap: () => {
                      outLogin().then((onValue) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          '/',
                          (route) => route == null,
                        );
                      })
                    },
                  ),
                  GestureDetector(
                    child: ListTile(
                      leading: const Icon(Icons.add),
                      title: const Text('运动视频'),
                    ),
                    onTap: () => {NavigatorUtils.push(context, 'videoList')},
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('功能后续追加...'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
