import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:projectmobile/admin/dashboard/pemesanan/datapemesan.dart';

class Pemesanan extends StatefulWidget {
  const Pemesanan({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<Pemesanan> createState() => _PemesananState();
}

class _PemesananState extends State<Pemesanan> {
  String? selectedKurir;
  final _formKey = GlobalKey<FormState>();
  String id_user = "";
  String id_product = "";
  String fullname = "";
  String tanggal = "";
  String phone = "";
  String informasi = "";
  String alamat = "";
  String image = "";
  String kurir = "";

  Map<String, dynamic>? userData;
  Map<String, dynamic>? productData;

  void getUser() async {
    var response = await http.get(Uri.parse(
        'https://jilhan.000webhostapp.com/getnamauser.php?id=${widget.id}'));
    setState(() {
      userData = jsonDecode(response.body);
      id_user = userData?['id'];
    });
    debugPrint("$userData");
  }

  @override
  void initState() {
    super.initState();
    getUser();
    getProduct();
  }

  void getProduct() async {
    var response = await http.get(Uri.parse(
        'https://jilhan.000webhostapp.com/getdetailproduct.php?id=${widget.id}'));
    setState(() {
      productData = jsonDecode(response.body);
      id_product = productData?['id'];
    });
    debugPrint("$productData");
  }

  Future<void> onSubmit() async {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      String url = "https://jilhan.000webhostapp.com/addpesanan.php";
      try {
        await http.post(Uri.parse(url), body: {
          'id_user': id_user,
          'id_product': id_product,
          'fullname': fullname,
          'tanggal': _dateController.text,
          'phone': phone,
          'informasi': informasi,
          'alamat': alamat,
          'image': image,
          'kurir': kurir
        }).then((response) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const dataUser()));
        });
      } catch (exc) {
        debugPrint(exc.toString());
      }
    }
  }

  final TextEditingController _dateController = TextEditingController();
  late DateTime selectedDate;

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dateController.text = picked.toString();
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 110,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        margin: const EdgeInsets.all(10),
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
                              "Sepatu Bayi",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Rp. 10000",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      margin: const EdgeInsets.all(30),
                      child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/id/thumb/5/55/BNI_logo.svg/2560px-BNI_logo.svg.png",
                      ),
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "BANK BNI",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "No.Rekning",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "8806 087 1232 33121 8",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Hanya Menerima Dari Bank BNI",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    suffixIcon: Icon(Icons.people),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 3.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      fullname = value;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    suffixIcon: Icon(Icons.phone),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 3.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      phone = value;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Information',
                    suffixIcon: Icon(Icons.info),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 3.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      informasi = value;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    suffixIcon: Icon(Icons.streetview),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 3.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      alamat = value;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _dateController,
                  decoration: const InputDecoration(
                    labelText: 'Date',
                    suffixIcon: Icon(Icons.calendar_month),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 3.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a date';
                    }
                    return null;
                  },
                  onTap: _selectDate,
                  readOnly: true,
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _selectImage,
                  child: Text(image ?? 'Select an image'),
                ),
                const SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Courier',
                    suffixIcon: Icon(Icons.motorcycle),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 3.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  value: selectedKurir,
                  items: ['JNE', 'Tiki', 'Pos Indonesia', 'JNT']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedKurir = value;
                      kurir = value ?? '';
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: onSubmit,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
