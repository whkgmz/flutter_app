import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 布局包
import 'package:flutter_rush/network/http_utils.dart';
import 'package:dio/dio.dart'; // 请求包
import 'dart:convert';
import 'package:flutter_rush/model/login_model.dart';
import 'package:flutter_rush/routers/router_util.dart';
// import 'package:annotation_route/route.dart';
//import 'package:flutter_rush/routers/index.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  // 定义
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _name, _password;

  // 登录
  void submitLoginData(username, password) async {
    Response response;
    Dio dio = new Dio();
    response = await dio.post("http://localhost:3000/api/login",
        data: {"username": username, "password": password});
    print(response);
    Map<String, dynamic> json = jsonDecode(response.toString());
    // /*将Json转成实体类*/
    LoginModel newsBean = LoginModel.fromJson(json);
    print(newsBean.code);
    if (newsBean.code == 0) {
      // 登录成功后跳转页面
      NavigatorUtils.push(context, '/mine');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //导航栏
          title: Text("登录")),
      body: Container(
          margin: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(50)),
          padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil.getInstance().setHeight(40)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                '密码登录',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil.getInstance().setSp(40)),
              ),
              Container(
                margin: EdgeInsets.only(top: 80),
                child: Form(
                    //autovalidate: true,
                    key: _formKey, //设置globalKey，用于后面获取FormState
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        hintColor: Colors.grey, //定义下划线颜色
                        // inputDecorationTheme: InputDecorationTheme(
                        //     labelStyle:
                        //         TextStyle(color: Colors.grey), //定义label字体样式
                        //     hintStyle: TextStyle(
                        //         color: Colors.grey, fontSize: 14.0) //定义提示文本样式
                        //     )
                      ),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                              keyboardType: TextInputType.text,
                              //autofocus: true,
                              decoration: InputDecoration(
                                  labelText: "用户名",
                                  hintText: "请输入用户名",
                                  // labelStyle: TextStyle(color: Colors.grey),
                                  hintStyle: TextStyle(color: Colors.grey),
                                  //focusColor: Color.fromRGBO(96, 170, 245, 1),
                                  // //获得焦点下划线设为蓝色
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(96, 170, 245, 1)),
                                  ),
                                  prefixIcon: Icon(Icons.person)),
                              // 校验用户名
                              validator: (v) {
                                return v.trim().length > 0 ? null : "用户名不能为空";
                              },
                              onChanged: (v) {
                                //print("onChange: $v");
                                _name = v;
                              }),
                          TextFormField(
                              decoration: InputDecoration(
                                  labelText: "密码",
                                  hintText: "请输入密码",
                                  labelStyle: TextStyle(color: Colors.grey),
                                  hintStyle: TextStyle(color: Colors.grey),
                                  focusColor: Colors.grey,
                                  //获得焦点下划线设为蓝色
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  prefixIcon: Icon(Icons.lock)),
                              obscureText: true,
                              // 检验密码
                              validator: (v) {
                                return v.trim().length > 5 ? null : "密码不能少于6位";
                              },
                              onChanged: (v) {
                                //print("onChange: $v");
                                _password = v;
                              }),
                          Container(
                            margin: EdgeInsets.only(
                                top: ScreenUtil.getInstance().setHeight(50)),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    // 线性渐变
                                    colors: [
                                      Color.fromRGBO(96, 170, 245, 1),
                                      Color.fromRGBO(124, 185, 249, 1)
                                    ]),
                                borderRadius: BorderRadius.circular(36.0) // 渐变色
                                ),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: FlatButton(
                                    // padding: EdgeInsets.all(
                                    //     ScreenUtil.getInstance().setHeight(10)),
                                    child: Text(
                                      "登 录",
                                      style: TextStyle(
                                          fontSize: ScreenUtil.getInstance()
                                              .setSp(30)),
                                    ),
                                    color: Colors.transparent,
                                    textColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(36.0)),
                                    onPressed: () {
                                      // 通过_formKey.currentState 获取FormState后，
                                      // 调用validate()方法校验用户名密码是否合法，校验
                                      // 通过后再提交数据。
                                      if ((_formKey.currentState as FormState)
                                          .validate()) {
                                        //验证通过提交数据
                                        submitLoginData(_name, _password);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: ScreenUtil.getInstance().setHeight(30)),
                child: Text(
                  '验证码登录',
                  style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(24),
                      color: Color.fromRGBO(51, 51, 51, 1)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: ScreenUtil.getInstance().setHeight(200)),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: ScreenUtil.getInstance().setHeight(1),
                        color: Color.fromRGBO(229, 229, 229, 1),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '第三方账号登录',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Color.fromRGBO(102, 102, 102, 1)),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: ScreenUtil.getInstance().setHeight(1),
                        color: Color.fromRGBO(229, 229, 229, 1),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(
                      top: ScreenUtil.getInstance().setHeight(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Image(
                            image: AssetImage("assets/images/wechat.png"),
                            width: ScreenUtil.getInstance().setWidth(58),
                            height: ScreenUtil.getInstance().setWidth(58),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: ScreenUtil.getInstance().setHeight(15)),
                            child: Text(
                              '微信',
                              style: TextStyle(
                                  color: Color.fromRGBO(102, 102, 102, 1),
                                  fontSize: ScreenUtil.getInstance().setSp(20)),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: ScreenUtil.getInstance().setWidth(100)),
                        child: Column(
                          children: <Widget>[
                            Image(
                              image: AssetImage("assets/images/qq.png"),
                              width: ScreenUtil.getInstance().setWidth(58),
                              height: ScreenUtil.getInstance().setWidth(58),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: ScreenUtil.getInstance().setHeight(15)),
                              child: Text(
                                'QQ',
                                style: TextStyle(
                                    color: Color.fromRGBO(102, 102, 102, 1),
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(20)),
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Image(
                            image: AssetImage("assets/images/weibo.png"),
                            width: ScreenUtil.getInstance().setWidth(58),
                            height: ScreenUtil.getInstance().setWidth(58),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: ScreenUtil.getInstance().setHeight(15)),
                            child: Text(
                              '微博',
                              style: TextStyle(
                                  color: Color.fromRGBO(102, 102, 102, 1),
                                  fontSize: ScreenUtil.getInstance().setSp(20)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ))
            ],
          )),
    );
  }
}
