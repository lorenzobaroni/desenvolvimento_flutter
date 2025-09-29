import 'package:desenvolvimento_flutter_iniciante/pages/home_page.dart';
import 'package:desenvolvimento_flutter_iniciante/pages/second_page.dart';
import 'package:desenvolvimento_flutter_iniciante/routes/routes.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return {
    Routes.initialRoute: (BuildContext context) => HomePage(),
    Routes.secondPage: (BuildContext context) => SecondPage(),
  };
}