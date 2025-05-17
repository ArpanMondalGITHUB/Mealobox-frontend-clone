import 'package:flutter/material.dart';

class NumberedText extends StatelessWidget {
  final List<String> items;
  final double fontSize;
  final double spacing;
  final TextStyle? textStyle;

  const NumberedText({
    super.key,
    required this.items,
    this.fontSize = 16.0,
    this.spacing = 16.0,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        items.length,
        (index) => Padding(
          padding: EdgeInsets.only(bottom: spacing),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${index + 1}. ',
                style: textStyle ??
                    TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Expanded(
                child: Text(
                  items[index],
                  style: textStyle ??
                      TextStyle(
                        fontSize: fontSize,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
