import 'package:flutter/material.dart';
import 'package:projectmobile/admin/dashboard/dashboard.dart';

import 'package:projectmobile/customer/dashboardScreen.dart'
    show DashboardScreen;
import 'package:projectmobile/login/LoginPage.dart';
import 'package:projectmobile/admin/dashboard/dashboard.dart'
    show AdminDashboard;

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
        primarySwatch: Colors.pink,
      ),
      home: const LoginPage(),
      routes: <String, WidgetBuilder>{
        '/admin': (BuildContext context) => AdminDashboard(
              username: "username",
            ),
        '/customer': (BuildContext context) => DashboardScreen(
              username: "username",
            )
      },
    );
  }
}
