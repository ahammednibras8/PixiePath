import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/features/auth/components/auth_button.dart';
import 'package:travel_app/features/auth/components/auth_text_filed.dart';
import 'package:travel_app/features/auth/presentation/login/login_screen.dart';
import 'package:travel_app/features/auth/providers/forgot_password_provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();

    emailController.addListener(() {
      if (_formKey.currentState != null) {
        _formKey.currentState!.validate();
      }
    });

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(
              left: 12,
              top: 8,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
        body: ChangeNotifierProvider(
          create: (context) => ForgotPasswordProvider(),
          child: Consumer<ForgotPasswordProvider>(
            builder: (context, provider, child) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 26,
                    vertical: 34,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Text(
                          'Enter the email address you used to sign up.',
                          style: TextStyle(
                            fontSize: 28,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
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
                        AuthButton(
                          text: 'Send email',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    titlePadding: const EdgeInsets.all(16.0),
                                    contentPadding: const EdgeInsets.all(20.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Expanded(
                                          child: Text(
                                            'We\'ve sent a password reset email.',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        IconButton(
                                          icon: const Icon(Icons.close),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                    content: const Text(
                                      'Check your inbox for an email from PixiePath and follow the instructions to reset your password',
                                    ),
                                    actions: [
                                      AuthButton(
                                        text: 'Back to sign in',
                                        backgroundColor: Colors.black,
                                        textColor: Colors.white,
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginScreen(),
                                            ),
                                          );
                                        },
                                      ),
                                      const SizedBox(height: 16),
                                      AuthButton(
                                        text: 'Resend email',
                                        onPressed: () {},
                                      )
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                        ),
                        const SizedBox(height: 33),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'We\'ll send you a password reset email.',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
