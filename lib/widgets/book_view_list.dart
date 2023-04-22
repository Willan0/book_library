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
    Key? key, required this.books, required this.listName,this.isHome = true

  }) : super(key: key);

  final List<Books> books;
  final String listName;
  final bool isHome;


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
          BookListViewItem(books: books,listName: listName,isHome: isHome,)
        ],
      ),
    );
  }
}

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({
    Key? key, required this.books
    , required this.listName, required this.isHome,
  }) : super(key: key);

  final List<Books> books;
  final String listName;
  final bool isHome;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {return 
        isHome
            ?BookOnlyView(books: books[index],isHome: isHome, listName: listName)
            : (books[index].isSelected ==true)
            ? BookOnlyView(books: books[index], isHome: isHome,listName: listName)
            : const SizedBox.shrink();
          },
      ),
    );
  }
}

class BookOnlyView extends StatelessWidget {
  const BookOnlyView({
    Key? key,
    required this.books,
    required this.listName, required this.isHome,
  }) : super(key: key);

  final Books books;
  final bool isHome;
  final String listName;

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      GestureDetector(
        onLongPress: (){
          showBottomSheet(
            enableDrag: true,
            context: context,
            builder: (context) => BottomSheetView(books: books),);
        },
        onTap: (){
          context.nextScreen(context,  DetailPage(
            imageLink: books.bookImage ?? '',
            description: books.description ?? '',
            author: books.author ?? '',
            bookName: books.title ?? '',
          ));
          context.getHomePageBlocInstance().onTapBook(books,listName);
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
                      height: kWh220x,
                        imgUrl: books.bookImage ?? ''),
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
                            onPressed: () => isHome?context.getHomePageBlocInstance().onTapFavorite(listName,books):context.getLibraryBlocInstance().onTapFavorite(listName, books),
                            icon:  Center(child:  Icon((books.isSelected ?? false)?CupertinoIcons.heart_fill:CupertinoIcons.heart,color:(books.isSelected ?? false)?Colors.red:Colors.amber,)),
                          ),
                      ),
                    ),
                  )
              ]),
              const SizedBox(height: kMp3x,),
              EasyText(text: books.title ?? '',fontColor: cSecondaryTextColor,fontSize: 12,)
            ],
          ),),
      ),
    ],
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
                context.previousScreen(context);
                context.nextScreen(context, ShelfPage(text: 'Add to new',bookVO: books,));
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
