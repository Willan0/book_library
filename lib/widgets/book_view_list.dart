import 'package:book_library/bloc/home_page_bloc.dart';
import 'package:book_library/constant/color.dart';
import 'package:book_library/constant/dimen.dart';
import 'package:book_library/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/vos/books_vo/book_vo.dart';
import '../data/vos/lists_vo/lists_vo.dart';
import 'easy_image.dart';
import 'easy_text.dart';

class BookListView extends StatelessWidget {
  const BookListView({
    Key? key,
    required this.lists,
  }) : super(key: key);

  final Lists lists;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kWh360x,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kMp10x),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                EasyText(text:lists.listName ?? ''),
                const Spacer(),
                const Icon(Icons.keyboard_arrow_right)
              ],
            ),
          ),
          const SizedBox(height: kMp20x,),
          BookListViewItem(books: lists.books ?? [],)
        ],
      ),
    );
  }
}

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({
    Key? key, required this.books,
    this.isChecked = false
  }) : super(key: key);

  final List<Books> books;
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
                  context: context,
                  builder: (context) => SizedBox(
                  height: 150,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(kMp20x),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 23,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(kRi15x),
                                  child: EasyImage(imgUrl: books[index].bookImage?? '',)),),
                            const SizedBox(width: kMp10x,),
                            EasyText(text: books[index].title ?? '',fontSize: 12,)
                          ],
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: kMp20x),
                        child: Row(children: [
                          Expanded(
                            child: TextButton(onPressed: (){},
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
                ),);

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
                              child: Selector<HomePageBloc,bool>(
                                selector: (_,selector)=> selector.getFavourite,
                                builder: (_,favourite,__)=>IconButton(
                                  onPressed: isChecked?null:() => context.getHomePageBlocInstance().save(),
                                  icon: Center(child:  Icon(CupertinoIcons.heart,color: favourite?Colors.red:cWhite,)),
                                ),

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
