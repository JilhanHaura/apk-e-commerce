import 'package:flutter/material.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({super.key});

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          Container(
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
                    "https://upload.wikimedia.org/wikipedia/id/thumb/5/55/BNI_logo.svg/2560px-BNI_logo.svg.png",
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Bank BNI",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Text(
                        "No. Rekening",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 49, 49, 49),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        "8806 087 1232 33121 8",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.amber,
                            fontWeight: FontWeight.w100),
                      ),
                      Divider(),
                      Text(
                        "Hanya Menerima Dari Bank BNI",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
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
                      "https://buatlogoonline.com/wp-content/uploads/2022/10/Logo-BCA-PNG-1024x768.png"),
                ),
                SizedBox(
                  width: 30,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Bank BCA",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Text(
                        "No. Rekening",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 49, 49, 49),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        "8806 087 1232 33121 8",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.amber,
                            fontWeight: FontWeight.w100),
                      ),
                      Divider(),
                      Text(
                        "Hanya Menerima Dari Bank BCA",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
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
                      "https://i2.wp.com/febi.uinsaid.ac.id/wp-content/uploads/2020/11/Logo-BRI-Bank-Rakyat-Indonesia-PNG-Terbaru.png?ssl=1"),
                ),
                SizedBox(
                  width: 30,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Bank BRI",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Text(
                        "No. Rekening",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 49, 49, 49),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        "8806 087 1232 33121 8",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.amber,
                            fontWeight: FontWeight.w100),
                      ),
                      Divider(),
                      Text(
                        "Hanya Menerima Dari Bank BRI",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
