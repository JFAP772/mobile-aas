import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projekrpl/beranda.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? selectedGender; // State untuk menyimpan jenis kelamin yang dipilih
  DateTime? selectedDate; // State untuk menyimpan tanggal yang dipilih
  File? _image; // State untuk menyimpan foto yang dipilih
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _profile(context),
            SizedBox(height: 20),
            _data(context),
          ],
        ),
      ),
    );
  }

  Widget _profile(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 70),
          child: GestureDetector(
            onTap: _selectImage,
            child: CircleAvatar(
              backgroundImage: _image != null
                  ? FileImage(_image!)
                  : AssetImage('kertas.jpeg') as ImageProvider,
              radius: 60,
            ),
          ),
        ),
      ],
    );
  }

  Widget _data(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              hintText: "Nama Lengkap",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.purple.withOpacity(0.1),
              filled: true,
              prefixIcon: Icon(
                Icons.person, // Use MdiIcons.phoneClassic
                size: 27,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        // Widget untuk memilih jenis kelamin
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jenis Kelamin',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            RadioListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.man,
                    size: 27,
                  ),
                  SizedBox(width: 10),
                  Text('Laki-laki'),
                ],
              ),
              value: 'L',
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value as String?;
                });
              },
            ),
            RadioListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.woman,
                    size: 27,
                  ),
                  SizedBox(width: 10),
                  Text('Perempuan'),
                ],
              ),
              value: 'P',
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value as String?;
                });
              },
            ),
          ],
        ),
        SizedBox(height: 20),
        // Widget untuk memilih tanggal lahir
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tanggal Lahir',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            GestureDetector(
              onTap: () {
                _selectDate(context);
              },
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: selectedDate != null
                        ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                        : 'Pilih Tanggal',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.purple.withOpacity(0.1),
                    filled: true,
                    prefixIcon: const Icon(Icons.calendar_today),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  hintText: "No HP",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.purple.withOpacity(0.1),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.phone_iphone, // Use MdiIcons.phoneClassic
                    size: 27,
                  ), // Adjust size as needed (default is 24)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                    hintText: "Alamat",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.purple.withOpacity(0.1),
                    filled: true,
                    prefixIcon: Icon(
                      Icons.location_on,
                    )),
              ),
            ),
            SizedBox(height: 20),
            // Tombol untuk menyimpan perubahan
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Logika untuk menyimpan profil di sini
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Beranda()));
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.purple,
                ),
                child: const Text(
                  "Simpan",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        print(File(pickedFile.path));
      });
    }
  }
}
