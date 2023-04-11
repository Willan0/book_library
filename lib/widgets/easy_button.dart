import 'package:book_library/constant/dimen.dart';
import 'package:book_library/widgets/easy_text.dart';
import 'package:flutter/material.dart';

class EasyButton extends StatelessWidget {
  const EasyButton({Key? key, required this.color, required this.text, required this.height, required this.textColor,this.width = 0, required this.onPressed}) : super(key: key);

  final Color color;
  final double height;
  final String text;
  final Color textColor;
  final double width;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: ()=> onPressed(),
      height: height,
      minWidth: width,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kRi10x)
      ),
      child: EasyText(text: text,fontColor: textColor,),
    );
  }
}
