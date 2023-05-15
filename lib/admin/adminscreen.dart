import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:projectmobile/customer/Appbar/appbar.dart';
import 'package:projectmobile/customer/BestProduct/best.dart';
import 'package:projectmobile/customer/Categori/CategoriProduct.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  // List<Map<String, dynamic>> __foundProduct = [];
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   __foundProduct =
  // }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          //Appbar
          // AppBarTest(
          //   username: 'username',
          // ),
          AppBarTest(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 214, 214, 214),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search Here...."),
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.search,
                        size: 25,
                        color: Color.fromARGB(255, 196, 33, 185),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: RichText(
                textAlign: TextAlign.start,
                text: const TextSpan(
                  text: "Categories",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 196, 33, 185)),
                )),
          ),
          //Kategori
          const SizedBox(
            height: 60,
            child: kategori(),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: RichText(
                textAlign: TextAlign.start,
                text: const TextSpan(
                  text: "Best Product",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 196, 33, 185)),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          //BestFood
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: BestProduct(),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        color: Color.fromARGB(255, 248, 154, 235),
        backgroundColor: Colors.transparent,
        items: <Widget>[
          IconButton(
              onPressed: () => {},
              icon: const Icon(
                Icons.home,
                size: 30,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () => {},
              icon: const Icon(
                Icons.shopping_bag,
                size: 30,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () => {},
              icon: Icon(Icons.people_sharp, size: 30, color: Colors.white)),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
    );
  }
}