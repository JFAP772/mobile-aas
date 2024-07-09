import 'package:flutter/material.dart';
import 'package:projekrpl/aktivitas.dart';
import 'package:projekrpl/akun.dart';
import 'package:projekrpl/jualbarangbekas.dart';
import 'package:projekrpl/jualsampah.dart';
import 'package:projekrpl/penarikankoin.dart';
import 'package:projekrpl/pickupsampah.dart';
import 'package:projekrpl/singup.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _header(context),
            _userdankoin(context),
            _menu(context),
            _informasi(context),
            _iklan(context),
            Spacer(), // Add Spacer to push the bottom navigation bar to the bottom
            _bottomnavbar(context),
          ],
        ),
      ),
    );
  }
}

Widget _header(BuildContext context) {
  return Column(
    children: [
      Container(
        height: 100,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100.0),
            bottomRight: Radius.circular(100.0),
          ),
          child: Stack(
            children: [
              Container(
                color: Colors.purple,
              ),
              Positioned(
                top: 30,
                left: 50,
                child: Text(
                  'Trash Agility',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                  top: 20,
                  right: 20,
                  child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 30,
                    ),
                  )),
              Positioned(
                  top: 20,
                  right: 70,
                  child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.message,
                      color: Colors.white,
                      size: 30,
                    ),
                  )),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget _userdankoin(BuildContext context) {
  return Column(
    children: [
      const SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Container(
          height: 150,
          child: Material(
            borderRadius: BorderRadius.circular(20),
            shadowColor: Colors.grey,
            color: Colors.white,
            elevation: 7.0,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/images/user_photo.jpg'), // Ganti dengan path foto pengguna
                    radius: 60,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama Pengguna ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                VerticalDivider(
                  indent: 10,
                  endIndent: 10,
                  thickness: 3,
                  color: Colors.purple,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.monetization_on,
                            color: Colors.yellow,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "0 koin",
                              style: TextStyle(color: Colors.yellow),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              //fungsi untuk icon qr
                            },
                            child: Icon(
                              Icons.qr_code_scanner,
                              size: 70,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    ],
  );
}

Widget _menu(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: EdgeInsets.only(
          top: 20,
        ),
        child: Container(
          height: 130,
          width: 100,
          child: Material(
              borderRadius: BorderRadius.circular(20),
              shadowColor: Colors.grey,
              color: Colors.white,
              elevation: 7.0,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PickupScreen()));
                    },
                    child: Icon(
                      Icons.fire_truck,
                      size: 70,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Pick UP"),
                  )
                ],
              )),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 20, left: 40),
        child: Container(
          height: 130,
          width: 100,
          child: Material(
              borderRadius: BorderRadius.circular(20),
              shadowColor: Colors.grey,
              color: Colors.white,
              elevation: 7.0,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => jualsampah()));
                    },
                    child: Icon(
                      Icons.sell_outlined,
                      size: 70,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Jual Sampah"),
                  )
                ],
              )),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 20, left: 40),
        child: Container(
          height: 130,
          width: 100,
          child: Material(
              borderRadius: BorderRadius.circular(20),
              shadowColor: Colors.grey,
              color: Colors.white,
              elevation: 7.0,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => jualbarangbekas()));
                    },
                    child: Icon(
                      Icons.recycling_outlined,
                      size: 65,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Jual Barang Bekas"),
                  )
                ],
              )),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 20, left: 40),
        child: Container(
          height: 130,
          width: 100,
          child: Material(
              borderRadius: BorderRadius.circular(20),
              shadowColor: Colors.grey,
              color: Colors.white,
              elevation: 7.0,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PenarikanKoinScreen()));
                    },
                    child: Icon(
                      Icons.attach_money,
                      size: 70,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Penarikan sKoin"),
                  )
                ],
              )),
        ),
      ),
    ],
  );
}

Widget _informasi(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black12,
              image: DecorationImage(
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(
                  "https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1584810359583-96fc3448beaa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _iklan(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(
            left: 20,
            top: 10), // left padding untuk menyelaraskan teks dengan kotak
        child: Text(
          "Kontribusi Daur Ulang",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
            left: 20), // left padding untuk menyelaraskan teks dengan kotak
        child: Text(
          "Berikut Kontribusi Daur Ulang Bersama Trash Agility",
          style: TextStyle(fontSize: 15),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
            top: 10, left: 20, right: 20), // left and right padding untuk kotak
        child: Container(
          height: 200,
          width: double.infinity,
          child: Material(
            borderRadius: BorderRadius.circular(20),
            shadowColor: Colors.grey,
            color: Colors.purple,
            elevation: 7.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "0",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                Text(
                  "Kilogram",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _bottomnavbar(BuildContext context) {
  int _selectedIndex = 0;

  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      return Container(
        height: 60, // Adjust the height as needed
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.purple,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });

            switch (index) {
              case 0:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Beranda()));
                break;
              case 1:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => aktivitas()));
                break;
              case 2:
                Navigator.pushNamed(context, '/riwayat');
                break;
              case 3:
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Akun()));
                break;
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event_note),
              label: 'Aktivitas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Riwayat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Akun',
            ),
          ],
        ),
      );
    },
  );
}
