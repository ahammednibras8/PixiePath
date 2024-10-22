import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/core/splash/splash_provider.dart';
import 'package:travel_app/features/auth/presentation/login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashProvider>(
      builder: (context, splashProvider, child) {
        if (splashProvider.isLoading) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/vectors/owl.png',
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          );
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
