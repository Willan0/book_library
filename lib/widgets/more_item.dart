import 'package:book_library/constant/dimen.dart';
import 'package:book_library/widgets/easy_text.dart';
import 'package:flutter/material.dart';

class MoreItem extends StatelessWidget {
  const MoreItem({Key? key, required this.text}) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        EasyText(text: text,fontWeight: FontWeight.bold,fontSize: kFs16x,),
        const Spacer(),
        const Icon(Icons.chevron_right),
      ]
    );
  }
}
