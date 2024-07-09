import 'package:flutter/material.dart';
import 'package:projekrpl/LoginPage.dart';
import 'package:projekrpl/aktivitas.dart';
import 'package:projekrpl/beranda.dart';
import 'package:projekrpl/user.dart';

class Akun extends StatefulWidget {
  const Akun({super.key});

  @override
  State<Akun> createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _fotodankoin(context),
            Spacer(),
            _bottomnavbar(context),
          ],
        ),
      ),
    );
  }
}

Widget _fotodankoin(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Container(
          height: 300,
          width: double.infinity,
          child: Material(
            borderRadius: BorderRadius.circular(20),
            shadowColor: Colors.grey,
            color: Colors.purple,
            elevation: 7.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/user_photo.jpg'), // Ganti dengan path foto pengguna
                    radius: 60,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "USERNAME",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.monetization_on,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "0 koin",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Material(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ubah Profile',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black),
          ),
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.black,
                      size: 30,
                    ),
                    Text(
                      'LOG OUT',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_forward,
                        color: Colors
                            .transparent), // Placeholder to maintain spacing
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _bottomnavbar(BuildContext context) {
  int _selectedIndex = 3; // Set default selected index to 3 (Akun)

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

            // Handle tap event here
            switch (index) {
              case 0:
                // Navigate to Beranda screen
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Beranda()));
                break;
              case 1:
                // Navigate to Aktivitas screen
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => aktivitas()));
                break;
              case 2:
                // Navigate to Riwayat screen
                Navigator.pushNamed(context, '/riwayat');
                break;
              case 3:
                // Navigate to Akun screen
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
