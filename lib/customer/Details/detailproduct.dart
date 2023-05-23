import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:projectmobile/customer/CartWidget/homechart.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      _quantity--;
    });
  }

  final List<Map<String, dynamic>> gridMap = [
    {
      "images":
          "https://media.istockphoto.com/id/1307563401/id/foto/botol-bayi-cincin-gigi-serbet-dan-dot-diisolasi-di-latar-belakang-putih.jpg?s=2048x2048&w=is&k=20&c=peBQ1IRaYgFO_KBeYrsU9ong8b_ddwmqjPeSWqgP50U=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/544442678/id/foto/botol-bayi-dot-dan-mainan-tergeletak-di-latar-belakang-putih.jpg?s=2048x2048&w=is&k=20&c=rlNOAs4hsx6CDakOUG4SisyCqMI2XLxTj_ws9nd-L0o=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/177799872/id/foto/komposisi-sepatu-bot-bayi-botol-dan-toy-untuk-gigi.jpg?s=2048x2048&w=is&k=20&c=E5AwxJmhNftDpFMlw5omQ2-na49Mu-1Dd2QX0U7L1bU=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/1478240378/id/foto/set-pakaian-bayi-dan-aksesoris-dengan-latar-belakang-putih-konsep-bayi-baru-lahir-flat-lay.jpg?s=2048x2048&w=is&k=20&c=3FyH5FY5L6X0G_hW0ef-_LVjssF9w35lU67a7kiJY4I=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/1138148870/id/foto/baby-shower-datar-berbaring-di-latar-belakang-biru-mainan-anak-dan-sampo-ruang-fotokopi-tempat.jpg?s=2048x2048&w=is&k=20&c=Wv0OoYDm2JZrC-4O3-Hvv02VJzHcaDTkGx3cGkqdzQM=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/1218031784/id/foto/alat-untuk-perawatan-gigi-pada-latar-belakang-biru.jpg?s=2048x2048&w=is&k=20&c=8dblDDWb93IAnDfAagAdPSKdlk7ilZfMkDPjxEkl4Dk=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/684133912/id/foto/latar-belakang-aksesoris-bayi.jpg?s=2048x2048&w=is&k=20&c=AaVNAk6L7PAJZFcYphWsr7xhC7BuPfb0kC8c-dBPYKA=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/684133912/id/foto/latar-belakang-aksesoris-bayi.jpg?s=2048x2048&w=is&k=20&c=AaVNAk6L7PAJZFcYphWsr7xhC7BuPfb0kC8c-dBPYKA=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/684133912/id/foto/latar-belakang-aksesoris-bayi.jpg?s=2048x2048&w=is&k=20&c=AaVNAk6L7PAJZFcYphWsr7xhC7BuPfb0kC8c-dBPYKA=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/684133912/id/foto/latar-belakang-aksesoris-bayi.jpg?s=2048x2048&w=is&k=20&c=AaVNAk6L7PAJZFcYphWsr7xhC7BuPfb0kC8c-dBPYKA=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/1307563401/id/foto/botol-bayi-cincin-gigi-serbet-dan-dot-diisolasi-di-latar-belakang-putih.jpg?s=2048x2048&w=is&k=20&c=peBQ1IRaYgFO_KBeYrsU9ong8b_ddwmqjPeSWqgP50U=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/544442678/id/foto/botol-bayi-dot-dan-mainan-tergeletak-di-latar-belakang-putih.jpg?s=2048x2048&w=is&k=20&c=rlNOAs4hsx6CDakOUG4SisyCqMI2XLxTj_ws9nd-L0o=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/177799872/id/foto/komposisi-sepatu-bot-bayi-botol-dan-toy-untuk-gigi.jpg?s=2048x2048&w=is&k=20&c=E5AwxJmhNftDpFMlw5omQ2-na49Mu-1Dd2QX0U7L1bU=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/1478240378/id/foto/set-pakaian-bayi-dan-aksesoris-dengan-latar-belakang-putih-konsep-bayi-baru-lahir-flat-lay.jpg?s=2048x2048&w=is&k=20&c=3FyH5FY5L6X0G_hW0ef-_LVjssF9w35lU67a7kiJY4I=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/1138148870/id/foto/baby-shower-datar-berbaring-di-latar-belakang-biru-mainan-anak-dan-sampo-ruang-fotokopi-tempat.jpg?s=2048x2048&w=is&k=20&c=Wv0OoYDm2JZrC-4O3-Hvv02VJzHcaDTkGx3cGkqdzQM=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/1218031784/id/foto/alat-untuk-perawatan-gigi-pada-latar-belakang-biru.jpg?s=2048x2048&w=is&k=20&c=8dblDDWb93IAnDfAagAdPSKdlk7ilZfMkDPjxEkl4Dk=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/684133912/id/foto/latar-belakang-aksesoris-bayi.jpg?s=2048x2048&w=is&k=20&c=AaVNAk6L7PAJZFcYphWsr7xhC7BuPfb0kC8c-dBPYKA=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/684133912/id/foto/latar-belakang-aksesoris-bayi.jpg?s=2048x2048&w=is&k=20&c=AaVNAk6L7PAJZFcYphWsr7xhC7BuPfb0kC8c-dBPYKA=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/684133912/id/foto/latar-belakang-aksesoris-bayi.jpg?s=2048x2048&w=is&k=20&c=AaVNAk6L7PAJZFcYphWsr7xhC7BuPfb0kC8c-dBPYKA=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/684133912/id/foto/latar-belakang-aksesoris-bayi.jpg?s=2048x2048&w=is&k=20&c=AaVNAk6L7PAJZFcYphWsr7xhC7BuPfb0kC8c-dBPYKA=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/1307563401/id/foto/botol-bayi-cincin-gigi-serbet-dan-dot-diisolasi-di-latar-belakang-putih.jpg?s=2048x2048&w=is&k=20&c=peBQ1IRaYgFO_KBeYrsU9ong8b_ddwmqjPeSWqgP50U=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/544442678/id/foto/botol-bayi-dot-dan-mainan-tergeletak-di-latar-belakang-putih.jpg?s=2048x2048&w=is&k=20&c=rlNOAs4hsx6CDakOUG4SisyCqMI2XLxTj_ws9nd-L0o=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/177799872/id/foto/komposisi-sepatu-bot-bayi-botol-dan-toy-untuk-gigi.jpg?s=2048x2048&w=is&k=20&c=E5AwxJmhNftDpFMlw5omQ2-na49Mu-1Dd2QX0U7L1bU=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/1478240378/id/foto/set-pakaian-bayi-dan-aksesoris-dengan-latar-belakang-putih-konsep-bayi-baru-lahir-flat-lay.jpg?s=2048x2048&w=is&k=20&c=3FyH5FY5L6X0G_hW0ef-_LVjssF9w35lU67a7kiJY4I=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/1138148870/id/foto/baby-shower-datar-berbaring-di-latar-belakang-biru-mainan-anak-dan-sampo-ruang-fotokopi-tempat.jpg?s=2048x2048&w=is&k=20&c=Wv0OoYDm2JZrC-4O3-Hvv02VJzHcaDTkGx3cGkqdzQM=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/1218031784/id/foto/alat-untuk-perawatan-gigi-pada-latar-belakang-biru.jpg?s=2048x2048&w=is&k=20&c=8dblDDWb93IAnDfAagAdPSKdlk7ilZfMkDPjxEkl4Dk=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/684133912/id/foto/latar-belakang-aksesoris-bayi.jpg?s=2048x2048&w=is&k=20&c=AaVNAk6L7PAJZFcYphWsr7xhC7BuPfb0kC8c-dBPYKA=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/684133912/id/foto/latar-belakang-aksesoris-bayi.jpg?s=2048x2048&w=is&k=20&c=AaVNAk6L7PAJZFcYphWsr7xhC7BuPfb0kC8c-dBPYKA=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/684133912/id/foto/latar-belakang-aksesoris-bayi.jpg?s=2048x2048&w=is&k=20&c=AaVNAk6L7PAJZFcYphWsr7xhC7BuPfb0kC8c-dBPYKA=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/684133912/id/foto/latar-belakang-aksesoris-bayi.jpg?s=2048x2048&w=is&k=20&c=AaVNAk6L7PAJZFcYphWsr7xhC7BuPfb0kC8c-dBPYKA=",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Baju Anak"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(
              tag: "Baju Anak",
              child: Image.network(
                "https://media.istockphoto.com/id/1307563401/id/foto/botol-bayi-cincin-gigi-serbet-dan-dot-diisolasi-di-latar-belakang-putih.jpg?s=2048x2048&w=is&k=20&c=peBQ1IRaYgFO_KBeYrsU9ong8b_ddwmqjPeSWqgP50U=",
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Baju Anak",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 25,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: _quantity > 1 ? _decrementQuantity : null,
                      ),
                      Text(
                        _quantity.toString(),
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: _incrementQuantity,
                      ),
                      SizedBox(width: 10.0),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    " Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.                    In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. ",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rp 10000",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 248, 154, 235),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeCart()))
                        },
                        child: Text("Add to Cart"),
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 248, 154, 235))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
