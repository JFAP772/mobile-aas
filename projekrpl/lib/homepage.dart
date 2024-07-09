import 'package:flutter/material.dart';

class hompage extends StatelessWidget {
  const hompage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(appBar: AppBar(),),
    );
  }
}