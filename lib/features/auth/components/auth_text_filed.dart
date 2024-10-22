import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  final String labelText;
  final bool isPasswordField;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const AuthTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.isPasswordField = false,
    this.validator,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? _errorText;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //Email Validator
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid email address';
    }
    final regEmail = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!regEmail.hasMatch(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  //Password Validator
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          TextSelectionTheme(
            data: TextSelectionThemeData(
              cursorColor: Colors.blue.shade400,
              selectionColor: Colors.blue.withOpacity(0.4),
              selectionHandleColor: Colors.blueAccent,
            ),
            child: TextFormField(
              controller: _controller,
              cursorColor: Colors.blue.shade300,
              decoration: InputDecoration(
                hintText: widget.labelText,
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
                errorText: _errorText,
              ),
              validator:
                  widget.isPasswordField ? _validatePassword : _validateEmail,
              onChanged: (value) {
                setState(
                  () {
                    if (widget.isPasswordField) {
                      _errorText = _validatePassword(value);
                    } else {
                      _errorText = _validateEmail(value);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
