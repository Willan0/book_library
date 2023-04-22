import 'package:book_library/bloc/home_page_bloc.dart';
import 'package:book_library/constant/dimen.dart';
import 'package:book_library/constant/string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_item/home_page_view_item.dart';
import '../../widgets/search_view_widget.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> HomePageBloc(kPublishedDate),
      child: Scaffold(
        body: Consumer<HomePageBloc>(
          builder: (_,bloc,__){
            return
            Column(
              children: [
                const SizedBox(height: kMp30x,),
                const SearchView(),
                bloc.getListsList.isEmpty?const Center(child: CircularProgressIndicator()):CarouselAndBookView(listsList: bloc.getListsList),
            ]);
          },
        ),
      ),
    );
  }
}





