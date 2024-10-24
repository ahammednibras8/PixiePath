import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/features/auth/components/auth_button.dart';
import 'package:travel_app/features/auth/components/auth_text_filed.dart';
import 'package:travel_app/features/auth/components/password_info_text.dart';
import 'package:travel_app/features/auth/providers/signup_provider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: SingleChildScrollView(
          child: ChangeNotifierProvider(
            create: (_) => SignupProvider(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Become a Tripadvisor \nmember.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 33),
                  Consumer<SignupProvider>(
                    builder: (context, provider, child) => AuthTextField(
                      labelText: 'Email address',
                      controller: provider.emailController,
                      errorText: provider.emailError,
                    ),
                  ),
                  const SizedBox(height: 33),
                  Consumer<SignupProvider>(
                    builder: (context, provider, child) => AuthTextField(
                      labelText: 'Password',
                      controller: provider.passwordController,
                      isPasswordField: true,
                      errorText: provider.passwordError,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Consumer<SignupProvider>(
                    builder: (context, provider, child) => PasswordInfoText(
                      text: 'At least 10 characters',
                      isValid: provider.isPasswordLengthValid,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Consumer<SignupProvider>(
                    builder: (context, provider, child) => PasswordInfoText(
                      text: 'Contains a special character',
                      isValid: provider.hasSpecialCharacter,
                    ),
                  ),
                  const SizedBox(height: 33),
                  Consumer<SignupProvider>(
                    builder: (context, provider, child) => AuthButton(
                      text: 'Sign Up',
                      onPressed: () {
                        if (provider.validateSignup()) {
                          provider.signUp(context);
                        }
                      },
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 33),
                  AuthButton(
                    text: 'Sign In',
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
