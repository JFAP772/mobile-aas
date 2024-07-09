import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:projekrpl/infopenjemputan.dart';

class plastik extends StatefulWidget {
  const plastik({super.key});

  @override
  State<plastik> createState() => _plastikState();
}

class _plastikState extends State<plastik> {
  bool _botolairmineralCek = false;
  bool _kresekCek = false;
  bool _pipaCek = false;
  bool _pembungkusmakananCek = false;
  bool _sterofoamCek = false;
  bool _sachetCek = false;

  File? _image;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sampah Plastik",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        // Added SingleChildScrollView
        child: Container(
          margin: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _jenisplastik(context),
              _fotosampah(context),
              _simpanButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _jenisplastik(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Container(
            height: 410,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 7.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Row(
                    children: [
                      Text("Perkiraan Berat"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Plastik",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 100,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "KG",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  indent: 35,
                  endIndent: 35,
                  color: Colors.black,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Row(
                    children: [
                      Text("Sub Keterangan Sampah"),
                    ],
                  ),
                ),
                _buildCheckboxRow("Botol Air Mineral", _botolairmineralCek,
                    (bool? newValue) {
                  setState(() {
                    _botolairmineralCek = newValue ?? false;
                  });
                }),
                _buildCheckboxRow(
                    "Botol shampo, Kresek atau Trashbag", _kresekCek,
                    (bool? newValue) {
                  setState(() {
                    _kresekCek = newValue ?? false;
                  });
                }),
                _buildCheckboxRow("Pipa", _pipaCek, (bool? newValue) {
                  setState(() {
                    _pipaCek = newValue ?? false;
                  });
                }),
                _buildCheckboxRow("Pembungkus Makanan", _pembungkusmakananCek,
                    (bool? newValue) {
                  setState(() {
                    _pembungkusmakananCek = newValue ?? false;
                  });
                }),
                _buildCheckboxRow("Sterofoam", _sterofoamCek, (bool? newValue) {
                  setState(() {
                    _sterofoamCek = newValue ?? false;
                  });
                }),
                _buildCheckboxRow("Sampah Kemasan sachet", _sachetCek,
                    (bool? newValue) {
                  setState(() {
                    _sachetCek = newValue ?? false;
                  });
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCheckboxRow(
      String title, bool value, Function(bool?) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(left: 70, right: 40, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Checkbox(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _fotosampah(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[300],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 7.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: Center(
              child: IconButton(
                icon: Icon(Icons.camera_alt, size: 50, color: Colors.grey[700]),
                onPressed: _pickImage,
              ),
            ),
          ),
        ),
        if (_image != null)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Image.file(
              _image!,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
      ],
    );
  }

  Widget _simpanButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Penjemputan()));
          // Save functionality
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child:
            Text("Simpan", style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}
