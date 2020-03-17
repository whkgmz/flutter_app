// 此页面主要功能为配置路由规则

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_rush/page/mine.dart';

// 首页
// Handler indexPageHanderl = Handler(
//   handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//     return IndexPage();
//   },
// );

// 正常路由跳转
Handler mineHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return MinePage();
});

// // 路由传参
// Handler routingReferenceHanderl = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   String id = params['id'].first;
//   return RoutingReference(id: id);
// });

// // 登陆页面
// Handler loginHanderl = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return Login();
// });
