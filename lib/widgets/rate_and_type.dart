import 'package:flutter/material.dart';

import 'easy_text.dart';

class RateAndType extends StatelessWidget {
  const RateAndType({
    Key? key, required this.up, required this.down,
  }) : super(key: key);

  final Widget up;
  final String down;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            up,
            EasyText(text: down),
          ],
        )
      ],
    );
  }
}