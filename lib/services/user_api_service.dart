import 'dart:convert';
import 'package:app/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserApiService {
  final String url = 'https://jsonplaceholder.typicode.com/users';

  Future<List<UserModel>> fetchUsers() async {
    try {
      print("Fetching users...");
      final response = await http.get(Uri.parse(url)).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception("Request timed out. Please check your connection.");
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => UserModel.fromJson(json)).toList();
      } else {
        throw Exception(
            "Failed to load users. Server error: ${response.statusCode}");
      }
    } on http.ClientException {
      throw Exception("Network error. Please check your internet connection.");
    } on FormatException {
      throw Exception("Invalid response format from server.");
    } on Exception catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }
}
