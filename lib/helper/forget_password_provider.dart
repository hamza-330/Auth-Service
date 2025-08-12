import 'package:flutter/material.dart';

class ForgetPasswordProvider extends ChangeNotifier {
  String _email = '';

  // Getters

  String get email => _email;

  // Setters

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }
}
