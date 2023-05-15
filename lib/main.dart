import 'package:flutter/material.dart';
import 'package:projectmobile/admin/addform.dart';
import 'package:projectmobile/admin/adminscreen.dart';
import 'package:projectmobile/admin/kategoriform.dart';

import 'package:projectmobile/customer/dashboardScreen.dart'
    show DashboardScreen;
import 'package:projectmobile/login/LoginPage.dart';

void main() {
  runApp(const MyApp());
}

String username = '';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PROJECT 3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/Admin': (BuildContext context) => new AddForm(
              username: username,
            ),
        '/Customer': (BuildContext context) => new DashboardScreen()
      },
    );
  }
}
