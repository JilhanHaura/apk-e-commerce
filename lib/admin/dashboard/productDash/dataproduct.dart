import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projectmobile/admin/dashboard/sidebar.dart';
import 'package:projectmobile/admin/form/product/addform.dart';
import 'package:projectmobile/admin/dashboard/productDash/editproduct.dart';

/// Flutter code sample for [DataTable].

class dataproduct extends StatefulWidget {
  const dataproduct({super.key});

  @override
  State<dataproduct> createState() => _dataproductState();
}

class _dataproductState extends State<dataproduct> {
  List product = [];

  void getdataproduct() async {
    String Url = "http://project3.test/new/viewproduct.php";
    var response = await http.get(Uri.parse(Url));
    setState(() {
      product = jsonDecode(response.body);
    });
  }

  void delete(String id) async {
    String url = "http://project3.test/new/deleteproduct.php";
    await http.post(Uri.parse(url), body: {'id': id});
    getdataproduct();
  }

  @override
  void initState() {
    getdataproduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: sidebar(),
        appBar: AppBar(
          title: Text("Welcome Admin!!"),
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'No',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.black),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Title',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.black),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Description',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.black),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Price',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.black),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Action',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.black),
                  ),
                ),
              ],
              rows: product.map((data) {
                return DataRow(
                  cells: <DataCell>[
                    DataCell(Text(data['id'])),
                    DataCell(Text(data['tittle'])),
                    DataCell(Text(data['description'])),
                    DataCell(Text(data['price'].toString())),
                    DataCell(
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.update),
                            onPressed: () async {
                              var inserted = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          editproduct(id: data['id'])));
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              delete(data["id"]);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              var inserted = await Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddForm()));
            },
            child: const Icon(CupertinoIcons.add_circled)));
  }
}
