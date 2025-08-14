import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

const String apiUrl = "https://689afafde727e9657f6346f7.mockapi.io/User";

Future<List<UserModel>> fetchAllUsers() async {
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    List<dynamic> body = json.decode(response.body);
    return body.map((item) => UserModel.fromJson(item)).toList();
  } else {
    throw Exception("Failed to fetch users");
  }
}
