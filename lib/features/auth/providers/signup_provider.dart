import 'package:flutter/material.dart';

class SignupProvider with ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _emailError;
  String? _passwordError;
  bool _isPasswordLengthValid = false;
  bool _hasSpecialCharacter = false;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  String? get emailError => _emailError;
  String? get passwordError => _passwordError;
  bool get isPasswordLengthValid => _isPasswordLengthValid;
  bool get hasSpecialCharacter => _hasSpecialCharacter;

  void validateSignup() {
    _emailError = _validateEmail(_emailController.text);
    _passwordError = _validatePassword(_passwordController.text);
    _updatePasswordValidation(_passwordController.text);
    notifyListeners();
  }

  String? _validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter an email address';
    }
    return null;
  }

  String? _validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter a password';
    }
    return null;
  }

  void _updatePasswordValidation(String value) {
    _isPasswordLengthValid = value.length >= 10;
    _hasSpecialCharacter = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    notifyListeners();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
