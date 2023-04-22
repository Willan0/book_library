import 'package:book_library/bloc/library_bloc.dart';
import 'package:book_library/constant/color.dart';
import 'package:book_library/constant/dimen.dart';
import 'package:book_library/data/vos/books_vo/book_vo.dart';
import 'package:book_library/pages/shelf_page.dart';
import 'package:book_library/widgets/easy_text.dart';
import 'package:book_library/widgets/search_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/vos/lists_vo/lists_vo.dart';

import '../../widgets/book_view_list.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: ChangeNotifierProvider(
        create: (_) => LibraryBloc(),
        child: Consumer<LibraryBloc>(
          builder: (context, bloc, child) => Scaffold(
            body: Column(
              children:  [
                const SizedBox(
                  height: kWh30x,
                ),
                const SearchView(),
                const TabBar(
                  unselectedLabelColor: cGrey,
                  labelColor: cCyan,
                  tabs: [
                    Tab(
                      text: 'Your Book',
                    ),
                    Tab(
                      text: 'Your Shelf',
                    ),
                  ],
                ),
                TabBarItemView(list: bloc.getFavouriteList),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabBarItemView extends StatelessWidget {
  const TabBarItemView({
    Key? key, required this.list,
  }) : super(key: key);

  final List<Lists> list;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(children: [

        Stack(children: [
                ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      if (index == 0 ||
                          !list[index - 1]
                              .books!
                              .any((bookVO) => bookVO.isSelected == true)) {
                        return Visibility(
                          visible: list[index]
                              .books!
                              .any((bookVO) => bookVO.isSelected == true),
                          child: BookListView(
                            books: list[index].books ?? [],
                            listName: list[index].listName ?? '',
                            isHome: false,
                          ),
                        );
                      } else {
                        return Visibility(
                          visible: list[index]
                              .books!
                              .any((bookVO) => bookVO.isSelected == true),
                          child: BookListView(
                            books: list[index].books ?? [],
                            listName: list[index].listName ?? '',
                            isHome: false,
                          ),
                        );
                      }
                    }),
                Visibility(
                    visible: list.every((list) =>
                        list.books!.every((book) => !(book.isSelected ?? false))),
                    child:
                        const Center(child: EasyText(text: 'There is no book')))
              ]),
         ShelfPage(
          isChecked: true,
          text: 'Create new',
          bookVO: Books(title: DateTime.now().toString(),order: 0),
        )
      ]),
    );
  }
}

