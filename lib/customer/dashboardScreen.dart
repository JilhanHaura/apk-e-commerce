import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:projectmobile/admin/dashboard/sidebar.dart';
import 'package:projectmobile/customer/Appbar/appbar.dart';
import 'package:projectmobile/customer/BestProduct/best.dart';
import 'package:projectmobile/customer/CartWidget/cartbar.dart';
import 'package:projectmobile/customer/CartWidget/cartbarwidget.dart';
import 'package:projectmobile/customer/CartWidget/homechart.dart';
import 'package:projectmobile/customer/Categori/CategoriProduct.dart';
import 'package:http/http.dart' as http;

class DashboardScreen extends StatefulWidget {
  // const DashboardScreen({Key? key}) : super(key: key);
  const DashboardScreen({super.key, required this.username, required this.id});
  final String username;
  final String id;
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // final TextEditingController searchController = TextEditingController();
  // List search = [];
  // void searchData() async {
  //   var response = await http.get(Uri.parse(
  //       "https://jilhan.000webhostapp.com/search.php?id=${widget.id}"));
  //   setState(() {
  //     search = jsonDecode(response.body);
  //   });
  //   debugPrint("${search}");
  // }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: sidebar(),
      appBar: AppBar(
        title: Text("Welcome "),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Color.fromARGB(255, 248, 154, 235),
                Color.fromARGB(255, 175, 207, 233)
              ])),
        ),
      ),
      body: ListView(
        children: [
          // AppBarTest(),
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
                          // controller: SearchController,
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
              onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CartWidget(
                                  id: "id",
                                )))
                  },
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
