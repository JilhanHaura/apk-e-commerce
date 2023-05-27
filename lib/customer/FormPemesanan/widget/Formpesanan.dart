import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:projectmobile/admin/dashboard/productDash/dataproduct.dart';
import 'package:projectmobile/customer/dashboardScreen.dart';
import 'package:projectmobile/main.dart';

class FormPemesanan extends StatefulWidget {
  const FormPemesanan({super.key});
  // const FormPemesanan({required this.username});
  // final String username;
  @override
  State<FormPemesanan> createState() => _FormPemesananState();
}

class _FormPemesananState extends State<FormPemesanan> {
  final _formKey = GlobalKey<FormState>();
  String name = "";
  String address = "";
  String NoTelp = "";
  // String discount = "";
  // String time = "";
  TextEditingController _dateController = TextEditingController();
  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString();
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> onSubmitPressed() async {
    final bool? isValid = _formKey.currentState?.validate();

    if (isValid == true) {
      String url = "";
      try {
        // DateTime now = DateTime.now();
        // time =
        //     "${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}:${now.second}";
        await http.post(Uri.parse(url), body: {
          'name': name,
          'address': address,
          'NoTelp': NoTelp,
          // 'time': time,
          // 'discount': discount,
        }).then((Response) => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => dataproduct()))
            });
      } catch (exc) {
        debugPrint(exc.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Pemesanan"),
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
          child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
              child: Text("Lengkapi Data Untuk Pesanan Anda",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                child: TextFormField(
                  autocorrect: true,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    hintText: "Nama Pembeli",
                    labelText: "Entri Nama Pembeli",
                    labelStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                    suffixIcon: const Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: const Icon(Icons.title),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 248, 154, 235),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 3.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please fill the name field';
                    }
                    return null;
                  },
                  onChanged: ((value) => name = value),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
              child: TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(
                  hintText: 'Tanggal Pemesanan',
                  labelText: 'Entri Tanggal Pemesanan',
                  labelStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                  suffixIcon: Icon(Icons.calendar_today),
                  filled: true,
                  fillColor: Color.fromARGB(255, 248, 154, 235),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 3.0,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                ),
                readOnly: true,
                onTap: _selectDate,
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Phone Number",
                    labelText: "Entri Phone Number",
                    labelStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                    suffixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: Icon(Icons.phone),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 248, 154, 235),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 3.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please fill the NoTelp field';
                    }

                    return null;
                  },
                  onChanged: ((value) => NoTelp = value),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Informasi Tambahan",
                    labelText: "Entri Informasi Tambahan",
                    labelStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                    suffixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 3.0,
                      child: Icon(Icons.streetview),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 248, 154, 235),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 3.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                    ),
                  ),
                  // obscureText: true,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please fill the address field';
                    }
                    return null;
                  },
                  // onChanged: ((value) => address = value),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Alamat Lengkap",
                    labelText: "Entri Alamat Lengkap",
                    labelStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                    suffixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 5.0,
                      child: Icon(Icons.streetview),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 248, 154, 235),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 3.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                    ),
                  ),
                  // obscureText: true,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please fill the address field';
                    }
                    return null;
                  },
                  onChanged: ((value) => address = value),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Bukti Pembayaran",
                    labelText: "Bukti Pembayaran",
                    labelStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                    suffixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: Icon(Icons.camera),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 248, 154, 235),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 3.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please fill the Bukti pembayaran field';
                    }

                    return null;
                  },
                  // onChanged: ((value) => NoTelp = value),
                )),
            const Divider(height: 30),
            ElevatedButton(
                child: const Text('Pesanan'),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 248, 154, 235),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DashboardScreen(username: username)))),
          ],
        ),
      )),
    );
  }
}
