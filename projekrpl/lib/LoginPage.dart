import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projekrpl/singup.dart';
import 'package:projekrpl/user.dart';
import 'beranda.dart'; // Ganti dengan import halaman beranda yang benar

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text;
      String password = _passwordController.text;

      try {
        var apiUrl = Uri.parse('http://localhost:8080/api/login');
        var response = await http.post(apiUrl, body: {
          'username': username,
          'password': password,
        });

        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          var token = data['token'];

          // Simpan token ke penyimpanan lokal jika diperlukan

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Profile()),
          );
        } else {
          var message = jsonDecode(response.body)['message'];
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text(message),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      } catch (e) {
        print('Error: $e');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text(
                  'Terjadi kesalahan saat melakukan login. Silakan coba lagi.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              _TabLogin(
                formKey: _formKey,
                usernameController: _usernameController,
                passwordController: _passwordController,
                obscureText: _obscureText,
                togglePasswordVisibility: _togglePasswordVisibility,
                login: _login,
              ), // Menggunakan StatefulWidget untuk form login
              _lupapassword(context),
              _tabsingup(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _header(context) {
  return const Column(
    children: [
      Text(
        "Trash Agility",
        style: TextStyle(
            fontSize: 40, fontWeight: FontWeight.bold, color: Colors.purple),
      ),
      Text(
        "Jaga Lingkungan Bersama Trash Agility",
        style: TextStyle(fontWeight: FontWeight.bold),
      )
    ],
  );
}

class _TabLogin extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final bool obscureText;
  final VoidCallback togglePasswordVisibility;
  final VoidCallback login;

  _TabLogin({
    required this.formKey,
    required this.usernameController,
    required this.passwordController,
    required this.obscureText,
    required this.togglePasswordVisibility,
    required this.login,
  });

  @override
  __TabLoginState createState() => __TabLoginState();
}

class __TabLoginState extends State<_TabLogin> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: widget.usernameController,
            decoration: InputDecoration(
              hintText: "Username",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.purple.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.person),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Masukkan username Anda';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: widget.passwordController,
            decoration: InputDecoration(
              hintText: "Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.purple.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                  widget.obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: widget.togglePasswordVisibility,
              ),
            ),
            obscureText: widget.obscureText,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Masukkan password Anda';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: widget.login,
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.purple,
            ),
            child: const Text(
              "Login",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _lupapassword(context) {
  return TextButton(
    onPressed: () {
      // Tambahkan navigasi ke halaman lupa password jika diperlukan
    },
    child: const Text(
      "Lupa Password?",
      style: TextStyle(color: Colors.purple),
    ),
  );
}

Widget _tabsingup(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("Belum punya akun? "),
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SingUp()),
          );
        },
        child: const Text(
          "Daftar",
          style: TextStyle(color: Colors.purple),
        ),
      ),
    ],
  );
}
