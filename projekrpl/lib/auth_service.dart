import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const apiUrl = 'http://localhost:8080/api/register'; // Ganti dengan URL API Anda

  Future<bool> signUp(String username, String email, String password) async {
    try {
      var response = await http.post(
        Uri.parse('$apiUrl/register'),
        body: jsonEncode({
          'username': username,
          'email': email,
          'password': password,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Registrasi berhasil
        return true;
      } else {
        // Gagal registrasi, tampilkan pesan atau tangani error
        print('Failed to sign up: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      // Tangani error koneksi atau lainnya
      print('Error signing up: $e');
      return false;
    }
  }
}
