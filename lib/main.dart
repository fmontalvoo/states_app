import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:states_app/pages/page_one.dart';
import 'package:states_app/pages/page_two.dart';

import 'package:states_app/services/user_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new UserService(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: 'one',
        routes: {'one': (_) => PageOne(), 'two': (_) => PageTwo()},
      ),
    );
  }
}
