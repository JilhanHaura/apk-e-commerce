import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({Key? key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String msg = '';
  Future<void> onRegisterPressed() async {
    final response = await http.post(
      Uri.parse("http://project3.test/new/register.php"),
      body: {
        "username": usernameController.text,
        "password": passwordController.text,
      },
    ).then((response) => {Navigator.pop(context, true)});
    // debugPrint(response.body);
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
                  backgroundImage: AssetImage('images/babyshop.jpg'),
                ),
              ),
            ),
            Container(
              height: deviceHeight * 0.65,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Register Now',
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.01,
                    ),
                    Text('Silahkan Buat Akun Anda'),
                    SizedBox(
                      height: constraints.maxHeight * 0.08,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.12,
                      decoration: BoxDecoration(
                        color: Color(0xffB4B4B4).withOpacity(0.4),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Center(
                          child: TextField(
                            controller: usernameController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'username',
                            ),
                            // onChanged: (value) => username = value,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.02,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.12,
                      decoration: BoxDecoration(
                        color: Color(0xffB4B4B4).withOpacity(0.4),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Center(
                          child: TextField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'password',
                            ),

                            obscureText: true,
                            // onChanged: (value) => password = value,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.02,
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      width: double.infinity,
                      height: constraints.maxHeight * 0.12,
                      child: ElevatedButton(
                        onPressed: onRegisterPressed,
                        child: Text(
                          "Register",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 248, 154, 235),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
