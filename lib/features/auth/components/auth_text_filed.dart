import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/features/auth/providers/signup_provider.dart';

class AuthTextField extends StatelessWidget {
  final String labelText;
  final bool isPasswordField;
  final TextEditingController controller;
  final String? errorText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const AuthTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.isPasswordField = false,
    this.errorText,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final signupProvider = Provider.of<SignupProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: controller,
          obscureText: isPasswordField && !signupProvider.isPasswordVisible,
          validator: validator,
          onChanged: (value) {
            signupProvider.updatePassword(value);
          },
          decoration: InputDecoration(
            hintText: labelText,
            errorText: errorText,
            hintStyle: const TextStyle(
              color: Color(0xffAAAAAA),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xffE9E9E9),
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xff0373F3),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xff0373F3),
                width: 2,
              ),
            ),
            suffixIcon: isPasswordField
                ? IconButton(
                    icon: Icon(
                      signupProvider.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: const Color(0xff0373F3),
                    ),
                    onPressed: () {
                      signupProvider.tooglePasswordVisibility();
                    },
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
