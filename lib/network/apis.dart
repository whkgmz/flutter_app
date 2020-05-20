import 'dart:convert';
import 'package:flutter_rush/network/dio_util.dart';
import 'package:flutter_rush/constant/net_constant.dart';

import 'package:flutter_rush/model/login_model.dart'; // 登录model
import 'package:flutter_rush/model/register_model.dart'; // 登录model
import 'package:flutter_rush/model/videoList_model.dart'; // 登录model

class ApiUtil {
  // 登录接口
  Future requestLogin(data) async {
    var response = await DioUtils().post(NetConstant.LOGIN, data: data);
    Map<String, dynamic> json = jsonDecode(response.toString());
    // /*将Json转成实体类*/
    LoginModel jsonModel = LoginModel.fromJson(json);
    print(jsonModel.code);
    return jsonModel;
  }

  // 注册接口
  Future requestRegister(data) async {
    var response = await DioUtils().post(NetConstant.REGISTER_PATH, data: data);
    Map<String, dynamic> json = jsonDecode(response.toString());
    // /*将Json转成实体类*/
    RegisterModel jsonModel = RegisterModel.fromJson(json);
    print(jsonModel.code);
    return jsonModel;
  }

  // 视频列表
  Future requestVideoList(data) async {
    var response = await DioUtils().get(NetConstant.VIDEO_LIST, data: data);
    //response = jsonEncode(response);
    Map<String, dynamic> json = jsonDecode(response.toString());
    // /*将Json转成实体类*/
    VideoListModel jsonModel = VideoListModel.fromJson(json);
    return jsonModel;
  }
}
