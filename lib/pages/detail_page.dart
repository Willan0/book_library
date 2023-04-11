
import 'package:book_library/constant/color.dart';
import 'package:book_library/constant/dimen.dart';
import 'package:book_library/utils/extension.dart';
import 'package:book_library/widgets/easy_text.dart';
import 'package:flutter/material.dart';

import '../view_item/detail_page_view_item.dart';
import '../widgets/more_item.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.bookName, required this.imageLink, required this.author, required this.description, }) : super(key: key);

  final String bookName;
  final String imageLink;
  final String author;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      appBar: AppBar(
        backgroundColor: cGreyShadow,
        leading: IconButton(icon:const Icon(Icons.chevron_left),onPressed: (){
          context.previousScreen(context);
        },),
        actions: const [
          Icon(Icons.search),
          SizedBox(width: kMp10x,),
          Icon(Icons.book),
          SizedBox(width: kMp10x,),
          Icon(Icons.more_vert),
          SizedBox(width: kMp10x,)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kMp10x),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: kMp10x,),
              /// book Title View
              BookTitleView(author: author,bookName: bookName,imageLink: imageLink),

              const SizedBox(height: kMp10x,),
              /// rate and type
              const RateAndTypeView(),

              const SizedBox(height: kMp10x,),

              const TwoButton(),

              const Divider(),


              //RatingBarAndAboutBook(description: book.description ?? '')

              const MoreItem(text: 'About the book'),

              EasyText(text: description),

              const SizedBox(height: kMp10x,),

              const MoreItem(text: 'Rating and review'),

              const SizedBox(height: kMp10x,),

              const RatingView(),
              const SizedBox(height: kMp10x,),


              //feed back

              const FeedBackView(),
              const FeedBackView(),
              const SizedBox(height: kMp10x,),


              // taking feedBack
              const TakeFeedBackView(),

              const SizedBox(height: kMp10x,),


            ],
          ),
        ),
      ),
    );
  }
}







