import 'package:flutter/material.dart';

void showOTpDialog({
  required BuildContext context,
  required TextEditingController codeController,
  required VoidCallback onPressed,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: const Text('Enter OTP'),
      content: Column(
        children: [
          TextFormField(
            controller: codeController,
          )
        ],
      ),
      actions: [
        TextButton(onPressed: 
        onPressed, child: 
        const Text('done'))
      ],
    ),
  );
}
