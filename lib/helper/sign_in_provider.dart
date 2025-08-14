import 'dart:convert';
import 'package:complete_flutter_api/helper/format_users.dart';
import 'package:complete_flutter_api/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class SignInProvider extends ChangeNotifier {
  String _email = '';
  String _password = '';
  String? _token;
  String? _userId;
  Map<String, dynamic>? loggedInUser;
  List<UserModel> _users = [];

  // Getters
  String get email => _email;
  String get password => _password;
  String? get token => _token;
  String? get userId => _userId;
  List<UserModel> get users => _users;

  // Setters
  void setEmail(String value) {
    _email = value.trim();
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  void setToken(String value) {
    _token = value;
    notifyListeners();
  }

  void setUserId(String value) {
    _userId = value;
    notifyListeners();
  }

  Future<void> loadUsers() async {
    _users = await fetchAllUsers();
    notifyListeners();
  }

  Future<void> login() async {
    try {
      final response = await http.get(
        Uri.parse('https://689afafde727e9657f6346f7.mockapi.io/User'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> users = json.decode(response.body);

        final matchedUser = users.firstWhere(
          (user) => user['email'] == _email && user['password'] == _password,
          orElse: () => null,
        );

        if (matchedUser != null) {
          _token = matchedUser['token'];
          _userId = matchedUser['id'];
          loggedInUser = matchedUser;
          notifyListeners();

          if (kDebugMode) {
            print("Logged in as: $loggedInUser");
          }
        } else {
          if (kDebugMode) {
            print(" Invalid email or password");
          }
        }
      } else {
        if (kDebugMode) {
          print(" Failed to login: ${response.statusCode}");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(" Error during login: $e");
      }
    }
  }

  Future<void> fetchLoggedInUser() async {
    if (_userId == null) {
      if (kDebugMode) {
        print(" No user ID found — cannot fetch profile.");
      }
      return;
    }

    try {
      final response = await http.get(
        Uri.parse('https://689afafde727e9657f6346f7.mockapi.io/User/$_userId'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        loggedInUser = json.decode(response.body);
        notifyListeners();

        if (kDebugMode) {
          print(" Profile fetched: $loggedInUser");
        }
      } else {
        if (kDebugMode) {
          print(" Failed to fetch profile: ${response.statusCode}");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(" Error fetching profile: $e");
      }
    }
  }
}
