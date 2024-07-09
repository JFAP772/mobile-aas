import 'package:flutter/material.dart';
import 'package:projekrpl/akun.dart';
import 'package:projekrpl/beranda.dart';

class aktivitas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Aktivitas(),
    );
  }
}

class Aktivitas extends StatefulWidget {
  @override
  _AktivitasState createState() => _AktivitasState();
}

class _AktivitasState extends State<Aktivitas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Aktivitas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSampahAndaSection(),
            SizedBox(height: 20),
            Text(
              'Pengepul Sedang dalam Perjalanan,\nTunggu sebentar ya',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            _buildPengepulSection(),
          ],
        ),
      ),
      bottomNavigationBar: _bottomnavbar(context),
    );
  }

  Widget _buildSampahAndaSection() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Icon(Icons.image, size: 50),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sampah Anda', style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Text('Jenis Sampah: Kertas', style: TextStyle(fontSize: 14)),
              Text('Berat: 1 Kilogram', style: TextStyle(fontSize: 14)),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.monetization_on, color: Colors.orange),
                  SizedBox(width: 4),
                  Text('1000 Koin', style: TextStyle(fontSize: 14)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPengepulSection() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/user_photo.jpg'),
                radius: 20,
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pengepul', style: TextStyle(fontSize: 16)),
                  Text('Honda beat II AA2022BZ',
                      style: TextStyle(fontSize: 14)),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Pengepul akan tiba dalam 20 menit siapkan sampah anda!',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 16),
          Icon(Icons.map, size: 50),
        ],
      ),
    );
  }

  Widget _bottomnavbar(BuildContext context) {
    int _selectedIndex = 1;

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
}
