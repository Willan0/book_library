import 'package:book_library/constant/color.dart';
import 'package:book_library/constant/dimen.dart';
import 'package:book_library/pages/detail_page.dart';
import 'package:book_library/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/vos/books_vo/book_vo.dart';
import '../pages/shelf_page.dart';
import 'easy_image.dart';
import 'easy_text.dart';
import 'more_item.dart';


class BookListView extends StatelessWidget {
  const BookListView({
    Key? key, required this.books, required this.listName,

  }) : super(key: key);

  final List<Books> books;
  final String listName;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kWh360x,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: kMp10x),
            child: MoreItem(text: listName),
          ),
          const SizedBox(height: kMp20x,),
          BookListViewItem(books: books,listName: listName,)
        ],
      ),
    );
  }
}

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({
    Key? key, required this.books
    , required this.listName,  this.isChecked = false
  }) : super(key: key);

  final List<Books> books;
  final String listName;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Column(
          children: [
            GestureDetector(
              onLongPress: (){
                showBottomSheet(
                  enableDrag: true,
                  context: context,
                  builder: (context) => BottomSheetView(books: books[index]),);
              },
              onTap: (){
                context.nextScreen(context,  DetailPage(
                  imageLink: books[index].bookImage ?? '',
                  description: books[index].description ?? '',
                  author: books[index].author ?? '',
                  bookName: books[index].title ?? '',
                ));

              },
              child: Container(
                width: kWh160x,
                height: kWh300x,
                margin:const EdgeInsets.only(left: kMp10x),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kMp10x)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(kMp10x),
                          child: EasyImage(
                            height: kWh240x,
                              imgUrl: books[index].bookImage ?? ''),
                        ),
                      ),
                        Padding(
                          padding: const EdgeInsets.only(right: kMp20x),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: CircleAvatar(
                              radius: kRi18x,
                              backgroundColor: cWhite,
                              child:IconButton(
                                  onPressed: isChecked?null:() => context.getHomePageBlocInstance().save(listName,books[index]),
                                  icon: const Center(child:  Icon(CupertinoIcons.heart,color:Colors.red,)),
                                ),
                            ),
                          ),
                        )
                    ]),
                    const SizedBox(height: kMp3x,),
                    EasyText(text: books[index].title ?? '',fontColor: cSecondaryTextColor,fontSize: 12,)
                  ],
                ),),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomSheetView extends StatelessWidget {
  const BottomSheetView({
    Key? key,
    required this.books,
  }) : super(key: key);

  final Books books;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    height: kWh160x,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(kMp20x),
          child: Row(
            children: [
              CircleAvatar(
                radius: kRi23x,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(kRi15x),
                    child: EasyImage(
                      height: kWh160x,
                      imgUrl: books.bookImage?? '',)),),
              const SizedBox(width: kMp10x,),
              EasyText(text: books.title ?? '',fontSize: kFs12x,)
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kMp20x),
          child: Row(children: [
            Expanded(
              child: TextButton(onPressed: (){
                context.nextScreen(context, const ShelfPage(text: 'Add to new',));
              },
                  style: TextButton.styleFrom(
                    side: const BorderSide(
                      color: cGrey
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kRi15x),
                    )
                  ),
                  child: const EasyText( text: 'Add to shelf',)),
            )
          ],),
        )
      ],
    ),
    );
  }
}
