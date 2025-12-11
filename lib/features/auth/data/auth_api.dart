import 'dart:convert';
import 'package:http/http.dart' as http; 

class AuthApi {
  final String baseUrl = "http://localhost:3000";

  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse("$baseUrl/auth/login");

    final res = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (res.statusCode != 200) {
      throw Exception(jsonDecode(res.body)["message"] ?? "Login failed");
    }

    return jsonDecode(res.body);
  }

  Future<Map<String, dynamic>> register(
    String name,
    String email,
    String password,
  ) async {
    final url = Uri.parse("$baseUrl/auth/register");

    final res = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"name": name, "email": email, "password": password}),
    );

    if (res.statusCode != 201 && res.statusCode != 200) {
      throw Exception(jsonDecode(res.body)["message"] ?? "Register failed");
    }

    return jsonDecode(res.body);
  }
}
