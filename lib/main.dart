import 'package:flutter/material.dart';

import 'package:get/route_manager.dart';

import 'package:states_app/pages/page_one.dart';
import 'package:states_app/pages/page_two.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'one',
      getPages: [
        GetPage(name: 'one', page: () => PageOne()),
        GetPage(name: 'two', page: () => PageTwo()),
      ],
    );
  }
}
