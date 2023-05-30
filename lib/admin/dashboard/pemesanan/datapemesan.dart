import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:projectmobile/admin/dashboard/kategori/updatekategori.dart';
import 'package:projectmobile/admin/dashboard/sidebar.dart';
import 'package:projectmobile/admin/dashboard/pemesanan/detailpemesanr.dart';
import 'package:projectmobile/admin/form/kategori/kategoriform.dart';
import 'package:projectmobile/customer/FormPemesanan/widget/Formpesanan.dart';

class dataUser extends StatefulWidget {
  const dataUser({super.key});

  @override
  State<dataUser> createState() => _dataUserState();
}

class _dataUserState extends State<dataUser> {
  List user = [];

  void getDataUser() async {
    String Url = "https://jilhan.000webhostapp.com/viewpemesanan.php";
    var response = await http.get(Uri.parse(Url));
    setState(() {
      user = jsonDecode(response.body);
    });
  }

  void delete(String id) async {
    String Url = "";
    await http.post(Uri.parse(Url), body: {'id': id});
    getDataUser();
  }

  @override
  void initState() {
    getDataUser();
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
                    'Nama Pembeli',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.black),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'No Handphone',
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
              rows: user.map((data) {
                return DataRow(
                  cells: <DataCell>[
                    DataCell(Text(data['id'])),
                    DataCell(Text(data['nama_pembeli'])),
                    DataCell(Text(data['phone'])),
                    DataCell(
                      Row(
                        children: [
                          ElevatedButton(
                            // icon: Icon(Icons.details),
                            onPressed: () async {
                              var inserted = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => detailUser()));
                            },
                            child: Text("Details"),
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
                  MaterialPageRoute(builder: (context) => FormPemesanan()));
            },
            child: const Icon(CupertinoIcons.add_circled)));
  }
}
