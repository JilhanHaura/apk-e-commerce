import 'package:flutter/material.dart';

import 'package:projectmobile/customer/dashboardScreen.dart';

class CartBar extends StatelessWidget {
  const CartBar({super.key});

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
                      builder: (context) => DashboardScreen(
                            username: 'username',
                            id: 'id',
                          )))
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 30,
              color: Color.fromARGB(255, 248, 154, 235),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Cart",
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 248, 154, 235)),
            ),
          ),
          Spacer(),
          Icon(
            Icons.more_vert_outlined,
            size: 30,
            color: Color.fromARGB(255, 248, 154, 235),
          ),
        ],
      ),
    );
  }
}
