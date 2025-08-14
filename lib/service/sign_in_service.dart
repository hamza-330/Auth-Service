import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

const kLoginApiUrl = 'https://689afafde727e9657f6346f7.mockapi.io/User';

Future signInUser(String email, String password) async {
  try {
    final response = await http.get(Uri.parse(kLoginApiUrl));

    if (response.statusCode != 200) {
      print(' Failed to fetch users: ${response.statusCode}');
      return null;
    }

    final List users = jsonDecode(response.body);

    final user = users.firstWhere(
      (u) =>
          (u['email']?.toString().trim().toLowerCase() ==
              email.trim().toLowerCase()) &&
          (u['password']?.toString().trim() == password.trim()),
      orElse: () => null,
    );

    if (user == null) {
      print('Invalid email or password');
      return null;
    }

    if (user['token'] != null && user['token'].toString().isNotEmpty) {
      print(' Login successful. Existing token: ${user['token']}');
      return user;
    }

    String newToken = const Uuid().v4();
    final updateResponse = await http.put(
      Uri.parse('$kLoginApiUrl/${user['id']}'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({...user, 'token': newToken}),
    );

    if (updateResponse.statusCode == 200) {
      final updatedUser = {...user, 'token': newToken};
      print(' Login successful. New token: $newToken');
      return updatedUser;
    } else {
      print(' Failed to update token in MockAPI');
      return null;
    }
  } catch (e) {
    print(' Error: $e');
    return null;
  }
}
