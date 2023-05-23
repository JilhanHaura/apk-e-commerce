import 'package:flutter/material.dart';
import 'package:projectmobile/admin/dashboard/dashboard.dart';
import 'package:projectmobile/admin/dashboard/kategori/datakategori.dart';
import 'package:projectmobile/admin/dashboard/productDash/dataproduct.dart';
import 'package:projectmobile/customer/dashboardScreen.dart';
import 'package:projectmobile/login/LoginPage.dart';

class sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('JilhanHaura.com'),
            accountEmail: Text('project3@gmail.com'),
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
              // image: DecorationImage(
              //     fit: BoxFit.fill,
              //     image: NetworkImage(
              //         'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AdminDashboard(
                            username: 'username',
                          )))
            },
          ),
          ListTile(
            leading: Icon(Icons.ad_units),
            title: Text('Product'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => dataproduct()))
            },
          ),
          ListTile(
            leading: Icon(Icons.ac_unit_outlined),
            title: Text('Categories'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => datakategori()))
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('Pemesanan'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('customer page'),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DashboardScreen(
                            username: 'username',
                          )))
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => null,
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
