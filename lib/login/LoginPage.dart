import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projectmobile/login/signup.dart';
import 'package:projectmobile/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    debugPrint(response.body);
    var data = jsonDecode(response.body);
    if (data.length == 0) {
      setState(() {
        msg = "login fail";
      });
    } else {
      if (data[0]['status'] == 'admin') {
        Navigator.pushReplacementNamed(context, '/admin');
      } else if (data[0]['status'] == 'customer') {
        Navigator.pushReplacementNamed(context, '/customer');
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
    final deviceHeight = MediaQuery.of(context).size.height;
    // final deviceWidht = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: deviceHeight * 0.30,
            child: FittedBox(
              child: CircleAvatar(
                  backgroundImage: AssetImage('images/babyshop.jpg')),
            ),
          ),
          Container(
            height: deviceHeight * 0.65,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: LayoutBuilder(builder: (content, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login Now',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.01,
                  ),
                  Text('Silahkan Masukan username & password anda'),
                  SizedBox(
                    height: constraints.maxHeight * 0.08,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.12,
                    decoration: BoxDecoration(
                        color: Color(0xffB4B4B4).withOpacity(0.4),
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Center(
                          child: TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'username'),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.02,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.12,
                    decoration: BoxDecoration(
                        color: Color(0xffB4B4B4).withOpacity(0.4),
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Center(
                          child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'password',
                        ),
                        obscureText: true,
                      )),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    width: double.infinity,
                    height: constraints.maxHeight * 0.12,
                    child: ElevatedButton(
                      onPressed: () {
                        _login();
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 248, 154, 235),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    width: double.infinity,
                    height: constraints.maxHeight * 0.12,
                    child: Row(
                      children: [
                        Text(
                          "Dont have an account ?",
                          style: TextStyle(fontSize: 15),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 248, 154, 235)),
                            ))
                      ],
                    ),
                  )
                ],
              );
            }),
          ),
        ],
      )),
    );
  }
}
