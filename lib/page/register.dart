import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 布局包\
import 'package:flutter_rush/routers/router_util.dart';
import 'package:flutter_rush/network/apis.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  // 定义
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _name, _password, _confirmPassword;

  void submitRegisterData(username, password) async {
    ApiUtil().requestRegister(
        {"username": username, "password": password}).then((onValue) {
      if (onValue.code == 0) {
        print('王洪魁');
        showAlertDialog(context);
      } else {
        Fluttertoast.showToast(
            msg: "${onValue.message}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1);
      }
    });
  }

  void goLogin() {
    NavigatorUtils.push(context, '/login', replace: true);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //导航栏
          title: Text("注册")),
      body: SingleChildScrollView(
          child: Container(
              margin:
                  EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(50)),
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil.getInstance().setHeight(40)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    '账号注册',
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
                                            color: Color.fromRGBO(
                                                96, 170, 245, 1)),
                                      ),
                                      prefixIcon: Icon(Icons.person)),
                                  // 校验用户名
                                  validator: (v) {
                                    return v.trim().length > 0
                                        ? null
                                        : "用户名不能为空";
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
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      prefixIcon: Icon(Icons.lock)),
                                  obscureText: true,
                                  // 检验密码
                                  validator: (v) {
                                    return v.trim().length > 5
                                        ? null
                                        : "密码不能少于6位";
                                  },
                                  onChanged: (v) {
                                    //print("onChange: $v");
                                    _password = v;
                                  }),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText: "确认密码",
                                      hintText: "请输入密码",
                                      labelStyle: TextStyle(color: Colors.grey),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      focusColor: Colors.grey,
                                      //获得焦点下划线设为蓝色
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      prefixIcon: Icon(Icons.lock)),
                                  obscureText: true,
                                  // 检验密码
                                  validator: (v) {
                                    return v.trim().length > 5
                                        ? null
                                        : "密码不能少于6位";
                                  },
                                  onChanged: (v) {
                                    //print("onChange: $v");
                                    _confirmPassword = v;
                                  }),
                              Container(
                                margin: EdgeInsets.only(
                                    top:
                                        ScreenUtil.getInstance().setHeight(50)),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        // 线性渐变
                                        colors: [
                                          Color.fromRGBO(96, 170, 245, 1),
                                          Color.fromRGBO(124, 185, 249, 1)
                                        ]),
                                    borderRadius:
                                        BorderRadius.circular(36.0) // 渐变色
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
                                          // _formKey.currentState 获取FormState后，
                                          // 调用validate()方法校验用户名密码是否合法，校验
                                          // 通过后再提交数据。
                                          if ((_formKey.currentState
                                                  as FormState)
                                              .validate()) {
                                            print(
                                                _confirmPassword != _password);
                                            if (_confirmPassword != _password) {
                                              Fluttertoast.showToast(
                                                  msg: "两次输入的密码不一致",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIos: 1);
                                            } else {
                                              //验证通过提交数据
                                              submitRegisterData(
                                                  _name, _password);
                                            }
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
                      child: GestureDetector(
                        child: Text(
                          '已有账号？去登录',
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(24),
                              color: Color.fromRGBO(51, 51, 51, 1)),
                        ),
                        onTap: goLogin,
                      )),
                ],
              ))),
    );
  }
}

void showAlertDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('提示'),
          content: Text('注册成功，去登录'),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'YES',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                print('yes...');
                NavigatorUtils.goBack(context);
                NavigatorUtils.push(context, '/login', replace: true);
              },
            ),
            FlatButton(
              child: Text(
                'NO',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                print('no...');
                Navigator.of(context).pop();
              },
            ),
          ],
          elevation: 20,
          semanticLabel: '哈哈哈哈',
          // 设置成 圆角
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        );
      });
}
