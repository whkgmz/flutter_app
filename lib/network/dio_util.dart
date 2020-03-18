import 'package:dio/dio.dart';
import 'package:flutter_rush/constant/net_constant.dart';
import 'package:shared_preferences/shared_preferences.dart'; // 负责本地存储
import 'dart:convert';

class DioUtils {
// 设置统一请求连接时间和超时时间
  static DioUtils instance;
  Dio dio;
  BaseOptions options;

  static DioUtils getInstance() {
    if (instance == null) instance = DioUtils();
    return instance;
  }

  /*
   * config it and create
   */
  DioUtils() {
    //BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数 针对特别接口需要特殊设置的
    options = BaseOptions(
      //请求基地址,可以包含子路径
      baseUrl: NetConstant.BASE_URL,
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 10000,
      //响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: 5000,
      //Http请求头.
      headers: {
        //do something
        "version": "1.0.0",
        "Authorization": '_token',
      },
      //请求的Content-Type，默认值是"application/json; charset=utf-8",Headers.formUrlEncodedContentType会自动编码请求体.
      //contentType: Headers.formUrlEncodedContentType,
      //表示期望以那种格式(方式)接受响应数据。接受四种类型 `json`, `stream`, `plain`, `bytes`. 默认值是 `json`,
      responseType: ResponseType.plain,
    );

    dio = Dio(options);

    //dio.interceptors.add(LogInterceptor(responseBody: false)); //开启请求日志

    //添加拦截器
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      // //我这边是在发送前到SharedPreferences（本地存储）中取出token的值，然后添加到请求头中
      //dio.lock()是先锁定请求不发送出去，当整个取值添加到请求头后再dio.unlock()解锁发送出去
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // var token = prefs.getString("token");
      // print(token == null);
      // dio.lock();
      // return future.then((value) {
      //   print(value);
      //   options.headers["Authorization"] = 'Bearer ' + value;
      //   return options;
      // }).whenComplete(() => dio.unlock()); // unlock the dio
      return options; //continue
    }, onResponse: (Response response) {
      // 在返回响应数据之前做一些预处理 此处拦截工作在数据返回之后，可在此对dio请求的数据做二次封装或者转实体类等相关操作
      print(response);
      // String tempRes = response.data.toString();
      // if (tempRes[0] == '[') {
      //   tempRes = '{"reslut":' + tempRes + '}';
      // }
      // Map<String, dynamic> result = json.decode(tempRes.toString());
      // response.data = result;
      return response;
    }, onError: (DioError e) {
      // Do something with response error
      formatError(e);
      return e; //continue
    }));
  }
  // 获取token
  // Future<dynamic> future = Future(() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   print(prefs.getString("token"));
  //   return prefs.getString("token");
  // });

  /*
   * get请求
   */
  get(url, {data, options}) async {
    Response response;
    try {
      response = await dio.get(url, queryParameters: data, options: options);
    } on DioError catch (e) {
      formatError(e);
    }
    return response;
  }

  /*
   * post请求
   */
  post(url, {data, options}) async {
    Response response;
    try {
      response = await dio.post(url, data: data, options: options);
    } on DioError catch (e) {
      formatError(e);
    }
    return response;
  }

  /*
   * error统一处理
   */
  void formatError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      // It occurs when url is opened timeout.
      print("连接超时");
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      // It occurs when url is sent timeout.
      print("请求超时");
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      //It occurs when receiving timeout
      print("响应超时");
    } else if (e.type == DioErrorType.RESPONSE) {
      // When the server response, but with a incorrect status, such as 404, 503...
      print("出现异常");
    } else if (e.type == DioErrorType.CANCEL) {
      // When the request is cancelled, dio will throw a error with this type.
      print("请求取消");
    } else {
      //DEFAULT Default error type, Some other Error. In this case, you can read the DioError.error if it is not null.
      print("未知错误");
    }
  }
}
