import 'package:flutter/material.dart';

// import '../view/home.dart';
import '../view/login_view.dart';

final routes = {
  // '/': (context, {arguments}) => Homepage(),
  '/': (context, {arguments}) => MyHomePage(),
};
// 固定写法
var  onGenerateRoute=  (RouteSettings  settings)  {
  // 统一处理RouteSettings = {_Type} RouteSettings
  final name = settings.name;
  final pageContentBuilder = routes[name];
  {
    if (pageContentBuilder != null) {
      if (settings.arguments != null) {
        final Route route = MaterialPageRoute(
            builder: (context) =>
                pageContentBuilder(context, arguments: settings.arguments));
        return route;
      } else {
        final Route route =
            MaterialPageRoute(builder: (context) => pageContentBuilder(context));
        return route;
      }
    }
  }
};
