import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BestProduct extends StatefulWidget {
  const BestProduct({Key? key}) : super(key: key);

  @override
  State<BestProduct> createState() => _BestProductState();
}

class _BestProductState extends State<BestProduct> {
  List listData = [];
  void getData() async {
    var response =
        await http.get(Uri.parse('http://project3.test/new/getproduct.php'));
    setState(() {
      listData = jsonDecode(response.body);
    });
    debugPrint("${listData.length}");
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  int count = 1;

  void addCount() {
    count = count + 1;
    setState(() {});
  }

  void removeCount() {
    if (count != 0) {
      count = count - 1;
      setState(() {});
    }
  }

  final List<Map<String, dynamic>> gridMap = [
    {
      // "title": "white sneaker with adidas logo",
      // "desc":
      //     "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.  ",
      // "price": "\$255",
      "images":
          "https://media.istockphoto.com/id/1307563401/id/foto/botol-bayi-cincin-gigi-serbet-dan-dot-diisolasi-di-latar-belakang-putih.jpg?s=2048x2048&w=is&k=20&c=peBQ1IRaYgFO_KBeYrsU9ong8b_ddwmqjPeSWqgP50U=",
    },
    {
      // "title": "Black Jeans with blue stripes",
      // "price": "\$245",
      "images":
          "https://media.istockphoto.com/id/544442678/id/foto/botol-bayi-dot-dan-mainan-tergeletak-di-latar-belakang-putih.jpg?s=2048x2048&w=is&k=20&c=rlNOAs4hsx6CDakOUG4SisyCqMI2XLxTj_ws9nd-L0o=",
    },
    {
      // "title": "Red shoes with black stripes",
      // "price": "\$155",
      "images":
          "https://media.istockphoto.com/id/177799872/id/foto/komposisi-sepatu-bot-bayi-botol-dan-toy-untuk-gigi.jpg?s=2048x2048&w=is&k=20&c=E5AwxJmhNftDpFMlw5omQ2-na49Mu-1Dd2QX0U7L1bU=",
    },
    {
      // "title": "Gamma shoes with beta brand.",
      // "price": "\$275",
      "images":
          "https://media.istockphoto.com/id/1478240378/id/foto/set-pakaian-bayi-dan-aksesoris-dengan-latar-belakang-putih-konsep-bayi-baru-lahir-flat-lay.jpg?s=2048x2048&w=is&k=20&c=3FyH5FY5L6X0G_hW0ef-_LVjssF9w35lU67a7kiJY4I=",
    },
    {
      // "title": "Alpha t-shirt for alpha testers.",
      // "price": "\$25",
      "images":
          "https://media.istockphoto.com/id/1138148870/id/foto/baby-shower-datar-berbaring-di-latar-belakang-biru-mainan-anak-dan-sampo-ruang-fotokopi-tempat.jpg?s=2048x2048&w=is&k=20&c=Wv0OoYDm2JZrC-4O3-Hvv02VJzHcaDTkGx3cGkqdzQM=",
    },
    {
      // "title": "Beta jeans for beta testers",
      // "price": "\$27",
      "images":
          "https://media.istockphoto.com/id/1218031784/id/foto/alat-untuk-perawatan-gigi-pada-latar-belakang-biru.jpg?s=2048x2048&w=is&k=20&c=8dblDDWb93IAnDfAagAdPSKdlk7ilZfMkDPjxEkl4Dk=",
    },
    {
      // "title": "V&V  model white t shirts.",
      // "price": "\$55",
      "images":
          "https://media.istockphoto.com/id/684133912/id/foto/latar-belakang-aksesoris-bayi.jpg?s=2048x2048&w=is&k=20&c=AaVNAk6L7PAJZFcYphWsr7xhC7BuPfb0kC8c-dBPYKA=",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        // childAspectRatio: 0.9,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 525,
      ),
      itemCount: listData.length,
      itemBuilder: (_, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            color: Color.fromARGB(255, 248, 154, 235),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(13.0),
                  topRight: Radius.circular(13.0),
                ),
                child: Image.network(
                  "${gridMap.elementAt(index)['images']}",
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        listData[index]['tittle'],
                        style: Theme.of(context).textTheme.subtitle1!.merge(
                              const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        listData[index]['description'],
                        style: Theme.of(context).textTheme.subtitle1!.merge(
                              const TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 13),
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Rp. ' + listData[index]['price'],
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: const [
                            Icon(
                              Icons.add_shopping_cart,
                              size: 20,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "Beli",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.remove_circle_outline,
                              size: 18,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Text('0',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700)),
                            ),
                            Icon(
                              Icons.add_circle_outline,
                              size: 18,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
