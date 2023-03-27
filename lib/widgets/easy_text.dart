import 'package:flutter/material.dart';

class EasyText extends StatelessWidget {
  const EasyText({Key? key,
  required this.text,
    this.fontWeight = FontWeight.w400,
    this.fontSize = 14.0,
    this.fontColor = Colors.black,
    this.decoration = TextDecoration.none
  }) : super(key: key);

  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color fontColor;
  final TextDecoration decoration;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
        decoration: decoration,
        fontWeight: fontWeight
      ),
    );
  }
}
