import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  String? _email;
  String? _password;
  String? _errorText;
  bool _isLoading = false;

  String? get email => _email;
  String? get password => _password;
  String? get errorText => _errorText;
  bool get isLoading => _isLoading;

  void setEmail(String email) {
    _email = email;
    _errorText = null;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    _errorText = null;
    notifyListeners();
  }

  Future<void> signIn() async {
    if (_email == null ||
        _email!.isEmpty ||
        _password == null ||
        _password!.isEmpty) {
      _errorText = 'Email and password cannot be empty.';
      notifyListeners();
      return;
    }

    _isLoading = true;
    notifyListeners();

    //Sign In Logic HERE>>>
    await Future.delayed(const Duration(seconds: 3));

    //Validation:
    if (_email != 'hello@ahammednibras.com' || _password != 'Pass') {
      _errorText = 'Invalid email or password';
    }

    _isLoading = false;
    notifyListeners();
  }

  void reset() {
    _email = null;
    _password = null;
    _errorText = null;
    notifyListeners();
  }
}
