import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      _quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // for (int i = 1; i < 3; i++)
        Container(
          height: 110,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                height: 70,
                width: 70,
                margin: EdgeInsets.all(10),
                child: Image.network(
                  "https://media.istockphoto.com/id/1307563401/id/foto/botol-bayi-cincin-gigi-serbet-dan-dot-diisolasi-di-latar-belakang-putih.jpg?s=2048x2048&w=is&k=20&c=peBQ1IRaYgFO_KBeYrsU9ong8b_ddwmqjPeSWqgP50U=",
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Product Tittle",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Price",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => {},
                      icon: Icon(
                        Icons.delete,
                        size: 25,
                        color: Colors.red,
                      ),
                    ),
                    //   Row(
                    //     children: [
                    //       Container(
                    //         padding: EdgeInsets.all(5),
                    //         decoration: BoxDecoration(
                    //             color: Colors.white,
                    //             borderRadius: BorderRadius.circular(2),
                    //             boxShadow: [
                    //               BoxShadow(
                    //                   color: Colors.green.withOpacity(0.5),
                    //                   spreadRadius: 1,
                    //                   blurRadius: 10)
                    //             ]),
                    //         child: Icon(
                    //           CupertinoIcons.plus,
                    //           size: 18,
                    //         ),
                    //       ),
                    //       Container(
                    //         margin: EdgeInsets.symmetric(horizontal: 10),
                    //         child: Text(
                    //           "01",
                    //           style: TextStyle(
                    //               fontSize: 15,
                    //               fontWeight: FontWeight.bold,
                    //               color: Colors.black),
                    //         ),
                    //       ),
                    //       Container(
                    //         padding: EdgeInsets.all(5),
                    //         decoration: BoxDecoration(
                    //             color: Colors.white,
                    //             borderRadius: BorderRadius.circular(2),
                    //             boxShadow: [
                    //               BoxShadow(
                    //                   color: Colors.green.withOpacity(0.5),
                    //                   spreadRadius: 1,
                    //                   blurRadius: 10)
                    //             ]),
                    //         child: Icon(
                    //           CupertinoIcons.minus,
                    //           size: 18,
                    //         ),
                    //       )
                    //     ],
                    //   )
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.remove,
                            color: Color.fromARGB(255, 248, 154, 235),
                          ),
                          onPressed: _quantity > 1 ? _decrementQuantity : null,
                        ),
                        Text(
                          _quantity.toString(),
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 248, 154, 235)),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Color.fromARGB(255, 248, 154, 235),
                          ),
                          onPressed: _incrementQuantity,
                        ),
                        SizedBox(width: 10.0),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
