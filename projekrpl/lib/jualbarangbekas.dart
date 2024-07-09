import 'package:flutter/material.dart';
import 'package:projekrpl/furnitur.dart';
import 'package:projekrpl/jualbekaselektronik.dart';
import 'package:projekrpl/kain.dart';
import 'package:projekrpl/sepatu.dart';

class jualbarangbekas extends StatefulWidget {
  const jualbarangbekas({super.key});

  @override
  State<jualbarangbekas> createState() => _jualbarangbekasState();
}

class _jualbarangbekasState extends State<jualbarangbekas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Jual Barang bekas",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [_menujualbarangbekas(context)],
        ),
      ),
    );
  }
}

Widget _menujualbarangbekas(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Kategori Barang Bekas",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      Padding(
        padding: EdgeInsets.only(top: 25, left: 20),
        child: Container(
          height: 150,
          child: Material(
            borderRadius: BorderRadius.circular(20),
            shadowColor: Colors.grey,
            color: Colors.white,
            elevation: 7.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("elektronik.jpg",
                        width: 100, height: 100, fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' Elektronik ',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BarangBekasElektronik()));
                        },
                        child: Text(
                          "Pilih",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(100, 50),
                            backgroundColor: Colors.purple),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 25, left: 20),
        child: Container(
          height: 150,
          child: Material(
            borderRadius: BorderRadius.circular(20),
            shadowColor: Colors.grey,
            color: Colors.white,
            elevation: 7.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("kertas.jpeg",
                        width: 100, height: 100, fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' Kain ',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BarangBekasElektronik()));
                        },
                        child: Text(
                          "Pilih",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(100, 50),
                            backgroundColor: Colors.purple),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 25, left: 20),
        child: Container(
          height: 150,
          child: Material(
            borderRadius: BorderRadius.circular(20),
            shadowColor: Colors.grey,
            color: Colors.white,
            elevation: 7.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("kertas.jpeg",
                        width: 100, height: 100, fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' Furniture ',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BarangBekasElektronik()));
                        },
                        child: Text(
                          "Pilih",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(100, 50),
                            backgroundColor: Colors.purple),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 25, left: 20),
        child: Container(
          height: 150,
          child: Material(
            borderRadius: BorderRadius.circular(20),
            shadowColor: Colors.grey,
            color: Colors.white,
            elevation: 7.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("kertas.jpeg",
                        width: 100, height: 100, fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' Sepatu ',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BarangBekasElektronik()));
                        },
                        child: Text(
                          "Pilih",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(100, 50),
                            backgroundColor: Colors.purple),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )
    ],
  );
}
