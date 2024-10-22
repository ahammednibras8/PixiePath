import 'package:flutter/material.dart';

class PasswordInfoText extends StatelessWidget {
  final String text;
  final bool isValid;

  const PasswordInfoText({
    super.key,
    required this.text,
    required this.isValid,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check : Icons.close,
          color: isValid ? Colors.green : Colors.red,
          size: 17,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            color: isValid ? Colors.grey.shade600 : Colors.red.shade600,
          ),
        )
      ],
    );
  }
}
