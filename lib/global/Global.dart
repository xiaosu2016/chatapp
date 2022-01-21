// import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Global {
  static Global? _instance;
  Dio? dio;
  static Global? getInstance() {
    if (_instance == null) _instance = new Global();
    return _instance;
  }

  Global() {
    dio =  Dio();
    dio?.options = BaseOptions(
      baseUrl: "http://www.google.com",
//      连接超时
      connectTimeout: 5000,
//      发送超时
      sendTimeout: 5000,
//      响应超时
      receiveTimeout: 5000,
//      请求头
      headers: {"token": "3030"},
//      接收得数据类型
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    );
//    拦截器
    dio?.interceptors.add(InterceptorsWrapper(
//        onRequest: (options, handler) {
//      print('请求' + options.headers.toString()); //请求的时候
//    },
//        onResponse: (response, handler) {
//      print('返回' + response.toString()); //返回的时候
//    },
        onError: (DioError e, handler) {
      if (e.type == DioErrorType.other) {
        print('');
      } else {
        print('接口错误');
      }

//      print('错误了' + e.toString()); //请求过期
    }));
  }
}
