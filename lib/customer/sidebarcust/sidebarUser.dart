import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projectmobile/login/LoginPage.dart';

class sidebarUser extends StatefulWidget {
  const sidebarUser({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<sidebarUser> createState() => _sidebarUserState();
}

class _sidebarUserState extends State<sidebarUser> {
  Map<String, dynamic>? data;
  void getUser() async {
    var response = await http.get(Uri.parse(
        'https://jilhan.000webhostapp.com/getnamauser.php?id=${widget.id}'));
    setState(() {
      data = jsonDecode(response.body);
    });
    debugPrint("${data}");
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(data?['username']),
            accountEmail: Text(data?['email']),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 248, 154, 235),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            onTap: () => {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => AdminDashboard(
              //               username: 'username',
              //             )))
            },
          ),
          ListTile(
            leading: Icon(Icons.ad_units),
            title: Text('Akun'),
            onTap: () => {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => dataproduct()))
            },
          ),
          ListTile(
            leading: Icon(Icons.ac_unit_outlined),
            title: Text('Pemesanan'),
            onTap: () => {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => datakategori()))
            },
          ),
          Divider(),
          ListTile(
            title: Text('Log Out'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LoginPage()))
            },
          ),
        ],
      ),
    );
  }
}
