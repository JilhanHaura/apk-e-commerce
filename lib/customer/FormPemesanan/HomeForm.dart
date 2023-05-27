import 'package:flutter/material.dart';
import 'package:projectmobile/customer/FormPemesanan/widget/FormBar.dart';
import 'package:projectmobile/customer/FormPemesanan/widget/Formpesanan.dart';

class HomeForm extends StatefulWidget {
  const HomeForm({super.key});

  @override
  State<HomeForm> createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        final screenHeight = constraints.maxHeight;

        return ListView(
          children: [
            FormBar(),
            Container(
              height: screenHeight,
              padding: EdgeInsets.only(top: 15),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 221, 219, 219),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35)),
              ),
              child: const Column(
                children: [
                  // panggil item widget
                  FormPemesanan()
                ],
              ),
            ),
          ],
        );
      }),
      // bottomNavigationBar: OrderBottom(),
    );
  }
}
