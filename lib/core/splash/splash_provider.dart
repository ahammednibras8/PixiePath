import 'package:flutter/material.dart';

class SplashProvider with ChangeNotifier {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  SplashProvider() {
    _initialize();
  }

  Future<void> _initialize() async {
    await Future.delayed(const Duration(seconds: 3));
    _isLoading = false;
    notifyListeners();
  }
}