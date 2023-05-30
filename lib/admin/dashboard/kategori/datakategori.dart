import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:projectmobile/admin/dashboard/kategori/updatekategori.dart';
import 'package:projectmobile/admin/dashboard/sidebar.dart';
import 'package:projectmobile/admin/form/kategori/kategoriform.dart';

class datakategori extends StatefulWidget {
  const datakategori({super.key});

  @override
  State<datakategori> createState() => _datakategoriState();
}

class _datakategoriState extends State<datakategori> {
  List kategori = [];

  void getDataKategori() async {
    String Url = "https://jilhan.000webhostapp.com/viewkategori.php";
    var response = await http.get(Uri.parse(Url));
    setState(() {
      kategori = jsonDecode(response.body);
    });
  }

  void delete(String id) async {
    String Url = "https://jilhan.000webhostapp.com/deletekategori.php";
    await http.post(Uri.parse(Url), body: {'id': id});
    getDataKategori();
  }

  @override
  void initState() {
    getDataKategori();
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
                    'Categorie',
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
              rows: kategori.map((data) {
                return DataRow(
                  cells: <DataCell>[
                    DataCell(Text(data['id'])),
                    DataCell(Text(data['categories'])),
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
                                          UpdateCategorie(id: data['id'])));
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
              var inserted = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CategoriForm()));
            },
            child: const Icon(CupertinoIcons.add_circled)));
  }
}
