import 'dart:convert';

import 'package:http/http.dart' as http;

const kApiUrl = 'https://httpbin.org/post';

Future<void> signUpUser(
  String email,
  String password,
  String firstName,
  String confirmPassword,
  String lastName,
) async {
  final url = Uri.parse(kApiUrl);

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json; charset=UTF-8'},
    body: jsonEncode({
      'email': email,
      'password': password,
      'last_name': lastName,
      'first_name': firstName,
      'confirm_password': confirmPassword,
    }),
  );

  if (response.statusCode == 200) {
    print('✅ User signed up successfully!');
    print('Response: ${response.body}');
  } else {
    print('❌ Failed to sign up. Code: ${response.statusCode}');
    print('Response: ${response.body}');
  }
}
