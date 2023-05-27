import 'package:flutter/material.dart';
import 'package:projectmobile/login/LoginPage.dart';

class AppBarTest extends StatelessWidget {
  // const AppBarTest({required this.username});
  // final String username;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 248, 154, 235),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          // IconButton(onPressed: (() {}), icon: Icon(Icons.sort)),
          Padding(
              padding: EdgeInsets.only(left: 20),
              child: TextButton(
                onPressed: () => {},
                child: Text(
                  "Welcome !!",
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 196, 33, 185)),
                ),
              )),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Icon(
                Icons.people_alt_rounded,
                size: 40,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
