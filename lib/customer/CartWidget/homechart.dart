import 'package:flutter/material.dart';

import 'package:projectmobile/customer/CartWidget/cartbar.dart';
import 'package:projectmobile/customer/CartWidget/cartbarwidget.dart';
import 'package:projectmobile/customer/CartWidget/cartbottombar.dart';

class HomeCart extends StatelessWidget {
  const HomeCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          CartBar(),
          Container(
            height: 700,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 221, 219, 219),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35)),
            ),
            child: Column(
              children: [
                // panggil item widget
                CartWidget()
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CartBottom(),
    );
  }
}
