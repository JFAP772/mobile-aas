import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:projekrpl/LoginPage.dart';
import 'package:projekrpl/aktivitas.dart';
import 'package:projekrpl/akun.dart';
import 'package:projekrpl/beranda.dart';
import 'package:projekrpl/infopenjemputan.dart';
import 'package:projekrpl/penarikankoin.dart';
import 'package:projekrpl/pickupsampah.dart';
import 'package:projekrpl/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Beranda(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:projekrpl/LoginPage.dart';
// //import 'package:projekrpl/akun.dart';
// //import 'package:projekrpl/beranda.dart';
// //import 'package:projekrpl/user.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// //import 'dart:io';

// // Import Home class
// //import 'beranda.dart'; // Gantilah 'home.dart' dengan nama file di mana class Home berada

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: LoginPage(),
//       routes: {
//         '/home': (context) => Home(), // Tambahkan route untuk Home
//         // Tambahkan routes lain jika diperlukan
//       },
//     );
//   }
// }

// // Home Class
// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   XFile? image;
//   List _images = [];
//   final ImagePicker picker = ImagePicker();

//   // Upload image function
//   Future sendImage(ImageSource media) async {
//     var img = await picker.pickImage(source: media);
//     var uri = "http://localhost:8080/rplapi/flutter_upload_image/create.php";
//     var request = http.MultipartRequest('POST', Uri.parse(uri));

//     if (img != null) {
//       var pic = await http.MultipartFile.fromPath("image", img.path);
//       request.files.add(pic);
//       await request.send().then((result) {
//         http.Response.fromStream(result).then((response) {
//           var message = jsonDecode(response.body);
//           final snackBar = SnackBar(content: Text(message['message']));
//           ScaffoldMessenger.of(context).showSnackBar(snackBar);
//           getImageServer();
//         });
//       }).catchError((e) {
//         print(e);
//       });
//     }
//   }

//   Future getImageServer() async {
//     try {
//       final response = await http.get(Uri.parse(
//           'http://localhost:8080/rplapi/flutter_upload_image/list.php'));
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         setState(() {
//           _images = data;
//         });
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     getImageServer();
//   }

//   // Popup dialog
//   void myAlert() {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//             title: Text('Please choose media to select'),
//             content: Container(
//               height: MediaQuery.of(context).size.height / 6,
//               child: Column(
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                       sendImage(ImageSource.gallery);
//                     },
//                     child: Row(
//                       children: [
//                         Icon(Icons.image),
//                         Text('From Gallery'),
//                       ],
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                       sendImage(ImageSource.camera);
//                     },
//                     child: Row(
//                       children: [
//                         Icon(Icons.camera),
//                         Text('From Camera'),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload Image'),
//         actions: [
//           IconButton(
//             onPressed: () => myAlert(),
//             icon: Icon(Icons.upload),
//           )
//         ],
//       ),
//       body: _images.length != 0
//           ? GridView.builder(
//               gridDelegate:
//                   SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//               itemCount: _images.length,
//               itemBuilder: (_, index) {
//                 return Padding(
//                   padding: EdgeInsets.all(10),
//                   child: Image(
//                     image: NetworkImage(
//                         'http://localhost:8080/rplapi/flutter_upload_image/images/' +
//                             _images[index]['image']),
//                     fit: BoxFit.cover,
//                   ),
//                 );
//               })
//           : Center(
//               child: Text("No Image"),
//             ),
//     );
//   }
// }
