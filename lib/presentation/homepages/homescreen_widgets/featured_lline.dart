import 'package:flutter/material.dart';

class FeaturedLine extends StatelessWidget {
  final String text;
  const FeaturedLine({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 2,
        children: [
          const Expanded(
            child: Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 8,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Colors.black87,
              letterSpacing: 2,
            ),
          ),
          const Expanded(
            child: Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 8,
            ),
          ),
        ],
      ),
    );
  }
}
