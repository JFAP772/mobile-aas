import 'package:flutter/material.dart';
import 'package:projekrpl/alumunium.dart';
import 'package:projekrpl/besidanlogam.dart';
import 'package:projekrpl/kertas.dart';
import 'package:projekrpl/plastik.dart';

class jualsampah extends StatefulWidget {
  const jualsampah({super.key});

  @override
  State<jualsampah> createState() => _jualsampahState();
}

class _jualsampahState extends State<jualsampah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Jual Sampah",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        margin: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [_menujualsampah(context)],
        ),
      ),
    );
  }
}

Widget _menujualsampah(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Kategori Sampah",
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
                        ' Kertas ',
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
                                  builder: (context) => Kertas()));
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
                    child: Image.asset("plastik.jpg",
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
                        ' Plastik ',
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
                                  builder: (context) => plastik()));
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
                    child: Image.asset("besi.jpg",
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
                        ' Besi dan Logam ',
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
                                  builder: (context) => besidanlogam()));
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
                    child: Image.asset("alumunium.jpg",
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
                        ' Alumunium ',
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
                                  builder: (context) => alumunium()));
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
