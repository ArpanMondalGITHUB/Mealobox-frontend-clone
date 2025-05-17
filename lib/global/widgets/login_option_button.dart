import 'package:flutter/material.dart';

class LoginOptionButton extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  const LoginOptionButton({super.key,required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      child: Text(text)
    );
  }
}
