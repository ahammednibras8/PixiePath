import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/features/auth/components/auth_button.dart';
import 'package:travel_app/features/auth/presentation/login/email_login_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 28, right: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/vectors/logo.png',
              color: Colors.black,
              scale: 2.6,
            ),
            const SizedBox(height: 12),
            const Text(
              'Sign in to start planning your trip.',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 28,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 44),
            RichText(
              text: TextSpan(
                text: 'By proceeding, you agree to our ',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'Terms of Use',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                  const TextSpan(
                    text: ' and Confirm you have read our ',
                  ),
                  TextSpan(
                    text: 'Terms of Use.',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 44),
            AuthButton(
              text: 'Continue with Google',
              image: 'assets/vectors/google_logo.png',
              onPressed: () {
                print('Google sign-in pressed');
              },
            ),
            const SizedBox(height: 33),
            AuthButton(
              text: 'Continue with Email',
              image: 'assets/vectors/email_icon.png',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EmailLoginScreen(),
                  ),
                );
                print('Email sign-in pressed');
              },
            ),
          ],
        ),
      ),
    );
  }
}
