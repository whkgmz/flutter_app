import 'dart:convert';
import 'package:flutter_rush/network/dio_util.dart';
import 'package:flutter_rush/constant/net_constant.dart';

import 'package:flutter_rush/model/login_model.dart'; // 登录model

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
}
