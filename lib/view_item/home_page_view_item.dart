

import 'package:book_library/bloc/home_page_bloc.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import '../constant/dimen.dart';
import '../data/vos/books_vo/book_vo.dart';
import '../data/vos/lists_vo/lists_vo.dart';
import '../widgets/book_view_list.dart';
class CarouselAndBookView extends StatelessWidget {
  const CarouselAndBookView({
    Key? key, required this.listsList,
  }) : super(key: key);

  final List<Lists> listsList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:  ListView(
          children: [
             Selector<HomePageBloc,List<Books>>(
               selector: (_,selector)=> selector.getTapBooks,
               builder: (context, books, child) {
                 List<Books> items = books.take(2).toList();
                 return items.isNotEmpty?CarouselSliderView(items: items):const SizedBox.shrink();},
             ),
            Column(
              children: listsList.map((lists) => BookView(lists: lists)).toList(),
            )
           ],
        ),
    );
  }
}

class CarouselSliderView extends StatelessWidget {
  const CarouselSliderView({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<Books> items;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: items.map((book) => BookOnlyView(books: book, listName: book.myListName ?? '', isHome: true,)).toList(),
        options: CarouselOptions(
          height: kWh300x,
          viewportFraction: 0.5,
          initialPage: 0,
          enableInfiniteScroll: false,
          reverse: true,
          enlargeFactor: 0.5,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        )
    );
  }
}
class BookView extends StatelessWidget {
  const BookView({
    Key? key, required this.lists,
  }) : super(key: key);
  final Lists lists;


  @override
  Widget build(BuildContext context) {
    return  BookListView(listName: lists.listName?? '',books:lists.books ?? []);
  }
}



