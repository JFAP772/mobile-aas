import 'dart:convert';
import 'package:http/http.dart' as http;

class Auth_Service {
  static const String baseUrl =
      'http://localhost:8080/api/login'; // Ganti dengan base URL API Anda

  Future<String?> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final token =
          jsonData['token']; // Sesuaikan dengan struktur respons API Anda
      return token;
    } else {
      // Handle error ketika gagal login
      return null;
    }
  }
}
