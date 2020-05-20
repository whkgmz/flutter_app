import 'package:flutter/material.dart';

import 'package:flutter_rush/constant/globalkey.dart';
import 'package:flutter_rush/utils/shared_preferences.dart';

//导航的观察者
//导航路由在跳转时的回调，比如 push，pop，remove，replace是，可以拿到当前路由和后面路由的信息
//继承NavigatorObserver
class NewObserver extends NavigatorObserver {
  @override
  static NewObserver _instance;

  static NewObserver getInstance() {
    // 唯一的实例
    if (_instance == null) {
      _instance = NewObserver();
    }
    return _instance;
  }

  void didPush(Route route, Route previousRoute) {
    // 当调用Navigator.push时回调
    super.didPush(route, previousRoute);
    RegExp reg = new RegExp(r"login|register|/");
    //可通过route.settings获取路由相关内容
    /// route.settings.name 获取到路由命名
    print(route.settings.name);
    // SpUtils.get(SpUtils.USERTOKEN, 'defaultObject').then((onValue) {
    //   // token不为空且不是登录页或者注册页
    //   if (onValue == null && !reg.hasMatch(route.settings.name)) {
    //     NavigatorKey.navigatorKey.currentState.pushNamed('/login');
    //   }
    //   // if (onValue == null &&
    //   //     route.settings.name != 'login' &&
    //   //     route.settings.name != 'register') {}
    // });
    print('跳转到下一个页面 ${route.settings.name}');
  }

  @override
  void didPop(Route route, Route previousRoute) {
    // 当调用Navigator.pop时回调
    super.didPop(route, previousRoute);
    //route.currentResult获取返回内容
  }

  @override
  void didRemove(Route route, Route previousRoute) {
    // 当调用Navigator.Remove时回调
    print('调用Navigator.Remove');
    super.didRemove(route, previousRoute);
  }
}
