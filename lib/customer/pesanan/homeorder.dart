import 'package:flutter/material.dart';
import 'package:projectmobile/customer/pesanan/widget/orderbar.dart';
import 'package:projectmobile/customer/pesanan/widget/orderbottom.dart';
import 'package:projectmobile/customer/pesanan/widget/orderwidget.dart';

class HomeOrder extends StatefulWidget {
  const HomeOrder({super.key});

  @override
  State<HomeOrder> createState() => _HomeOrderState();
}

class _HomeOrderState extends State<HomeOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        final screenHeight = constraints.maxHeight;

        return ListView(
          children: [
            OrderBar(),
            Container(
              height: screenHeight,
              padding: EdgeInsets.only(top: 15),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 221, 219, 219),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35)),
              ),
              child: const Column(
                children: [
                  // panggil item widget
                  OrderWidget()
                ],
              ),
            ),
          ],
        );
      }),
      bottomNavigationBar: OrderBottom(),
    );
  }
}
