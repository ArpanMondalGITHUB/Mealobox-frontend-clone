import 'package:flutter/material.dart';
import 'package:mealoboxclone/global/theme/appalatte.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  const Button({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Appallete.buttoncolor,
          borderRadius: BorderRadius.circular(10)),
      child: ElevatedButton(
          onPressed: ontap,
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(395, 30),
              backgroundColor: Appallete.buttoncolor,
              shadowColor: Appallete.transparentColor),
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Appallete.whiteColor),
          )),
    );
  }
}
