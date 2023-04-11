
import 'package:book_library/bloc/library_bloc.dart';
import 'package:book_library/constant/color.dart';
import 'package:book_library/constant/dimen.dart';
import 'package:book_library/pages/shelf_page.dart';
import 'package:book_library/widgets/search_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/vos/lists_vo/lists_vo.dart';
import '../../data/vos/shelf_vo/shelf_vo.dart';
import '../../view_item/shelf_page_view_item.dart';
import '../../widgets/book_view_list.dart';
import '../../widgets/easy_text.dart';

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
              SearchView(),
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
      child: TabBarView(
          children: [
        Selector<LibraryBloc, List<Lists>?>(
            selector: (_, selector) => selector.getListsList,
            builder: (_, listName, __) {
              if (listName == null) {
                return const Center(child: CircularProgressIndicator());
              }
              return listName.isEmpty
                  ? const Center(child: Text('There is no no book'))
                  :ListView.builder(
                            itemCount: listName.length,
                            itemBuilder: (context, index) => BookListView(books: listName[index].books ?? [] , listName: listName[index].listName ?? ''),);

            }),
        const ShelfPage(isChecked: true,text: 'Create new',)
      ]),
    );
  }
}


///Selector<LibraryBloc,List<Books>?>(
//                 selector: (_,selector)=> selector.getBooksList,
//                     builder: (_,bookList,__){
//                       if (bookList == null) {
//                         return const Center(child: CircularProgressIndicator());
//                       }
//                       return bookList.isEmpty?