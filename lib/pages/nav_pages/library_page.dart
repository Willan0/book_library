import 'package:book_library/bloc/library_bloc.dart';
import 'package:book_library/constant/color.dart';
import 'package:book_library/constant/dimen.dart';
import 'package:book_library/data/vos/books_vo/book_vo.dart';
import 'package:book_library/widgets/book_view_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: ChangeNotifierProvider(
        create: (_) => LibraryBloc(),
        child: Scaffold(
          body: Column(
            children: const [
              SizedBox(
                height: kWh30x,
              ),
              TabBar(
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
              TabBarItemView(),
            ],
          ),
        ),
      ),
    );
  }
}

class TabBarItemView extends StatelessWidget {
  const TabBarItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(children: [
        Consumer<LibraryBloc>(builder: (_, bloc, __) {
          return bloc.getListsList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView.builder(
                    itemCount: bloc.getListsList.length,
                    itemBuilder: (_, index) => BookListView(
                      lists: bloc.getListsList[index],
                    ),
                  ),
                );
        }),
        Selector<LibraryBloc, List<Books>?>(
            selector: (_, selector) => selector.getBooksList,
            builder: (_, lists, __) {
              if (lists == null) {
                return const Center(child: CircularProgressIndicator());
              }
              return lists.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: BookListViewItem(
                      books: lists ?? [],
                      isChecked: true,
                    ));
            })
      ]),
    );
  }
}
