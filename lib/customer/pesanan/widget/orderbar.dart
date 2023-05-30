import 'package:flutter/material.dart';
import 'package:projectmobile/customer/CartWidget/cartbarwidget.dart';
import 'package:projectmobile/customer/CartWidget/homechart.dart';

class OrderBar extends StatefulWidget {
  const OrderBar({super.key});

  @override
  State<OrderBar> createState() => _OrderBarState();
}

class _OrderBarState extends State<OrderBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          IconButton(
            onPressed: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartWidget(
                            id: "id",
                          )))
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 30,
              color: Colors.pink,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Pembayaran",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink),
            ),
          ),
          // Spacer(),
          // Icon(
          //   Icons.more_vert_outlined,
          //   size: 30,
          //   color: Color.fromARGB(255, 248, 154, 235),
          // ),
        ],
      ),
    );
  }
}
