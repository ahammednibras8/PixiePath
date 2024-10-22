import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/features/auth/components/auth_button.dart';
import 'package:travel_app/features/auth/components/auth_text_filed.dart';
import 'package:travel_app/features/auth/presentation/forgot_password_screen.dart';
import 'package:travel_app/features/auth/presentation/signup_screen.dart';
import 'package:travel_app/features/auth/providers/login_provider.dart';

class EmailLoginScreen extends StatelessWidget {
  const EmailLoginScreen({super.key});

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
        body: ChangeNotifierProvider(
          create: (context) => LoginProvider(),
          child: Consumer<LoginProvider>(
            builder: (context, provider, child) {
              final emailController = TextEditingController();
              final passwordController = TextEditingController();

              emailController.text = provider.email ?? '';
              passwordController.text = provider.password ?? '';

              return SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome back.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 22),
                    AuthTextField(
                      labelText: 'Email address',
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 22),
                    AuthTextField(
                      labelText: 'Password',
                      isPasswordField: true,
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationThickness: 3,
                          decorationColor: Colors.blue[700],
                        ),
                      ),
                    ),
                    const SizedBox(height: 44),
                    AuthButton(
                      text: 'Sign In',
                      onPressed: () {
                        provider.setEmail(emailController.text);
                        provider.setPassword(passwordController.text);
                        provider.signIn();
                      },
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                    ),
                    const SizedBox(height: 44),
                    AuthButton(
                      text: 'Sign Up',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                    ),
                    if (provider.errorText != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(
                          provider.errorText!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
