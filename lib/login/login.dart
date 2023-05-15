import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projectmobile/main.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String msg = '';
  Future<void> _login() async {
    final response = await http.post(
      Uri.parse("http://project3.test/new/login.php"),
      body: {
        "username": usernameController.text,
        "password": passwordController.text,
      },
    );
    var data = jsonDecode(response.body);
    if (data.length == 0) {
      setState(() {
        msg = "login fail";
      });
    } else {
      if (data[0]['status'] == 'admin') {
        Navigator.pushReplacementNamed(context, '/Admin');
      } else if (data[0]['status'] == 'customer') {
        Navigator.pushReplacementNamed(context, '/Customer');
      }
      print(response.body);
      setState(() {
        username = data[0]['username'];
      });
      return data;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Login',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30.0),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: 'username',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _login();
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
