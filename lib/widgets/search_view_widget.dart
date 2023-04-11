import 'package:book_library/constant/color.dart';
import 'package:book_library/constant/dimen.dart';
import 'package:book_library/constant/string.dart';
import 'package:book_library/utils/extension.dart';
import 'package:flutter/material.dart';

import '../pages/search_page.dart';
import 'easy_text.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.symmetric(horizontal: kMp10x),
      height: kWh50x,
      decoration:  BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(kRi15x)),
          border: Border.all(
              color: cBlack
          )
      ),
      child: Row(
        children: [
          const SizedBox(width: kMp10x,),
          const Icon(Icons.search),
          const SizedBox(width: kMp20x,),
          GestureDetector(
              onTap: (){
                context.nextScreen(context,const SearchPage());
              },
              child: const EasyText(text: kSearchBook,fontColor: cSecondaryTextColor,)),
          const Spacer(),
          const CircleAvatar(radius:kRi15x,backgroundColor:cCyan,child: Text('W'),),
          const SizedBox(width: kMp10x,)
        ],
      ),
    );
  }
}

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
