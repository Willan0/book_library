import 'package:book_library/constant/color.dart';
import 'package:book_library/constant/dimen.dart';
import 'package:book_library/constant/string.dart';
import 'package:book_library/utils/extension.dart';
import 'package:flutter/material.dart';

class SearchMovieWidget extends StatelessWidget {
  const SearchMovieWidget(
      {super.key,
        this.isEnable = false,
        this.isAutoFocus = false,
        this.onChange, required this.controller});

  final bool isEnable;
  final bool isAutoFocus;
  final Function(String)? onChange;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMp10x),
      child: TextField(
        onChanged: (text) => onChange!(text),
        autofocus: isAutoFocus,
        enabled: isEnable,
        controller: controller,
        onSubmitted: (text)=> context.getSearchBlocInstance().saveHistory(text),
        decoration:  const InputDecoration(
            filled: true,
            hintText: kSearchBook,
          hintStyle: TextStyle(color: cSecondaryTextColor),
          suffixIcon:  Icon(Icons.keyboard_voice),
        ),

      ),
    );
  }
}
