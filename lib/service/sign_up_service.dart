import 'dart:convert';
import 'package:http/http.dart' as http;

const kApiUrl = 'https://689afafde727e9657f6346f7.mockapi.io/User';

Future<void> signUpUser(
  String email,
  String password,
  String firstName,
  String confirmPassword,
  String lastName,
) async {
  final response = await http.post(
    Uri.parse(kApiUrl),
    headers: {'Content-Type': 'application/json; charset=UTF-8'},
    body: jsonEncode({
      'email': email,
      'password': password,
      'lastName': lastName,
      'firstName': firstName,
      'confirmPassword': confirmPassword,
    }),
  );

  if (response.statusCode == 201) {
    print(' User signed up successfully!');
    print('Response: ${response.body}');
  } else {
    print(' Failed to sign up. Code: ${response.statusCode}');
    print('Response: ${response.body}');
  }
}
