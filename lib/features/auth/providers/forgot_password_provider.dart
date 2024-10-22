import 'package:flutter/material.dart';

class ForgotPasswordProvider with ChangeNotifier {
  // ignore: unused_field
  String? _email;
  String? _errorText;

  String? get errorText => _errorText;

  void setEmail(String email) {
    _email = email;
    _errorText = _validateEmail(email);
    notifyListeners();
  }

  String? _validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter a valid email address.';
    }
    final regEmail = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!regEmail.hasMatch(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  bool isValid() {
    return _errorText == null;
  }

  void reset() {
    _email = null;
    _errorText = null;
    notifyListeners();
  }
}
