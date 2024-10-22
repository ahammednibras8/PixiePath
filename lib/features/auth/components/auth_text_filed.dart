import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String labelText;
  final bool isPasswordField;
  final TextEditingController controller;
  final String? errorText;
  final String? Function(String?)? validator;

  const AuthTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.isPasswordField = false,
    this.errorText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
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
          obscureText: isPasswordField,
          validator: validator,
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
          ),
        ),
      ],
    );
  }
}
