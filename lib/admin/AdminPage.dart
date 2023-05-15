// ignore: file_names
import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const AdminPage({required this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text('hallo $username')],
      ),
    );
  }
}
