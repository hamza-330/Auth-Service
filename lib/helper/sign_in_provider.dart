import 'package:flutter/foundation.dart';

class SignInProvider extends ChangeNotifier {
  String _email = '';
  String _password = '';

  // Getters

  String get email => _email;
  String get password => _password;

  // Setters

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }
}
