import 'package:flutter/material.dart';

class PasswordNotifier with ChangeNotifier {
  bool _password = true;

  bool get password => _password;

  setPassword() {
    _password = !_password;
    notifyListeners();
  }
}
