import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupProvider with ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? _emailError;
  String? _passwordError;
  bool _isPasswordLengthValid = false;
  bool _hasSpecialCharacter = false;
  bool _isSignUpEnabled = false;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  String? get emailError => _emailError;
  String? get passwordError => _passwordError;
  bool get isPasswordLengthValid => _isPasswordLengthValid;
  bool get hasSpecialCharacter => _hasSpecialCharacter;
  bool get isSignUpEnabled => _isSignUpEnabled;

  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;

  void tooglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void updateEmail(String value) {
    _emailError = null;
    _updateSignUpEnabled();
    notifyListeners();
  }

  void updatePassword(String value) {
    _passwordError = null;
    _updatePasswordValidation(value);
    _updateSignUpEnabled();
    notifyListeners();
  }

  bool validateSignup() {
    _emailError = _validateEmail(_emailController.text);
    _passwordError = _validatePassword(_passwordController.text);
    notifyListeners();
    return _emailError == null && _passwordError == null;
  }

  String? _validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter an email address';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 10) {
      return 'Password must be at least 10 characters long';
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  void _updatePasswordValidation(String value) {
    _isPasswordLengthValid = value.length >= 10;
    _hasSpecialCharacter = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  void _updateSignUpEnabled() {
    _isSignUpEnabled = _isPasswordLengthValid &&
        _hasSpecialCharacter &&
        _emailController.text.isNotEmpty;
  }

  Future<void> signUp(BuildContext context) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      print(userCredential);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
