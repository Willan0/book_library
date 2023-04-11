import 'package:flutter/material.dart';

import '../constant/color.dart';

class CreateShelfTextFieldView extends StatelessWidget {
  const CreateShelfTextFieldView({
    Key? key, required this.validator, required this.controller,
  }) : super(key: key);

  final Function(String?) validator;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value)=>validator(value ?? ''),
      decoration: const InputDecoration(
          fillColor: cGrey
      ),
      controller: controller,
    );
  }
}