import 'package:flutter/material.dart';

import 'router/Router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //去掉debug
      onGenerateRoute: onGenerateRoute, //调用路由封装好的组件 onGenerateRoute方法
      initialRoute: '/', //该页面为根页面
    );
  }
}
