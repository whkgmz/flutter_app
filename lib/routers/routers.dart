// 路由初始化 路由链接
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routes {
  static String root = "/";
  static String mine = "/mine";
  //static String webViewPage = '/webview';

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });

    /// 第一个参数是路由地址，第二个参数是页面跳转和传参，第三个参数是默认的转场动画
    //router.define(root, handler: splashHandler); // 自定义默认页面
    router.define(mine, handler: mineHandler);

    // router.define(webViewPage, handler: Handler(handlerFunc: (_, params) { // 跳转webview页面的方式
    //   String title = params['title']?.first;
    //   String url = params['url']?.first;
    //   return WebViewPage(title: title, url: url);
    // }))
  }
}
