import 'package:flutter/material.dart';
import 'package:projekrpl/gantipassword.dart';

class verifikasi extends StatefulWidget {
  const verifikasi({super.key});

  @override
  State<verifikasi> createState() => _verifikasiState();
}

class _verifikasiState extends State<verifikasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Verifikasi",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        margin: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _verifikasi(context),
          ],
        ),
      ),
    );
  }

  _verifikasi(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.0, top: 110.0),
              child: Text(
                "Verifikasi",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
          child: Column(
            children: [
              Text(
                "Enter your verification code",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                  hintText: "Verification Code",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.purple.withOpacity(0.1),
                  filled: true,
                  prefixIcon: Icon(Icons.password),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Kirim Ulang",
                  style: TextStyle(color: Colors.purple),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width:
                    double.infinity, // Set width to match the parent container
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => gantipassword()));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.purple,
                  ),
                  child: const Text(
                    "send",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
