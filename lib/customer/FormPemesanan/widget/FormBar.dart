import 'package:flutter/material.dart';
import 'package:projectmobile/customer/CartWidget/homechart.dart';
import 'package:projectmobile/customer/pesanan/homeorder.dart';

class FormBar extends StatefulWidget {
  const FormBar({super.key});

  @override
  State<FormBar> createState() => _FormBarState();
}

class _FormBarState extends State<FormBar> {
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
                  context, MaterialPageRoute(builder: (context) => HomeOrder()))
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 30,
              color: Color.fromARGB(255, 248, 154, 235),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Form Pemesanan",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 248, 154, 235)),
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
