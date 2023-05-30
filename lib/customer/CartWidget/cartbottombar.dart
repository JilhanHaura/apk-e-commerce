import 'package:flutter/material.dart';
import 'package:projectmobile/customer/pesanan/homeorder.dart';

class BottomCart extends StatefulWidget {
  const BottomCart({Key? key}) : super(key: key);

  @override
  State<BottomCart> createState() => _BottomCartState();
}

class _BottomCartState extends State<BottomCart> {
  Map<String, dynamic> dataCart = {};
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    double totalPrice = double.parse(dataCart['price'] ?? '0') * _quantity;
    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Rp. $totalPrice',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 248, 154, 235),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeOrder(),
                    ),
                  );
                },
                child: Text(
                  "Lakukan Pembayaran",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
