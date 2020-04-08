// 路由初始化 路由链接
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routes {
  static String root = "/";
  static String mine = "/mine";
  static String home = "/home";
  static String login = "/login";
  static String save = "/save";
  static String register = "/register";
  static String videoList = "/videoList";
  static String videoPlay = "/videoPlay";
  //static String webViewPage = '/webview';

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });

    /// 第一个参数是路由地址，第二个参数是页面跳转和传参，第三个参数是默认的转场动画
    router.define(root, handler: rootHandler); // 自定义默认页面
    router.define(mine, handler: minePageHandler); // 我的
    router.define(home, handler: homePageHandler); // 主页
    router.define(login, handler: loginPageHandler); // 登录
    router.define(save, handler: savePageHandler); // 收藏页
    router.define(register, handler: registerPageHandler); // 注册页
    router.define(videoList, handler: videoListPageHandler); // 视频列表页
    router.define(videoPlay, handler: videoPlayPageHandler); // 视频播放页

    // router.define(webViewPage, handler: Handler(handlerFunc: (_, params) { // 跳转webview页面的方式
    //   String title = params['title']?.first;
    //   String url = params['url']?.first;
    //   return WebViewPage(title: title, url: url);
    // }))
  }
}
