import 'package:book_library/bloc/bottom_nav_bloc.dart';
import 'package:book_library/constant/color.dart';
import 'package:book_library/constant/nav_pages.dart';
import 'package:book_library/constant/string.dart';
import 'package:book_library/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationPage extends StatelessWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> BottomNavigationBloc(),
      child: Scaffold(
        body: Selector<BottomNavigationBloc,int>(
          selector: (_,selector)=> selector.getIndex,
          builder: (_,index,__)=>IndexedStack(
            index: index,
            children: pages,
          ),
        ),
        bottomNavigationBar: Selector<BottomNavigationBloc,int>(
          selector: (_,selector)=> selector.getIndex,
          builder: (_,index,__)=> BottomNavigationView(index: index),
        ),
      ),
    );
  }
}

class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({
    Key? key, required this.index,
  }) : super(key: key);

  final int index ;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      selectedItemColor: cCyan,
      unselectedItemColor: cGrey,
      onTap: (index)=> context.getBottomNavigationBlocInstance().changePage(index),
      items: const[
        BottomNavigationBarItem(icon:  Icon(Icons.home),label: kHome),
        BottomNavigationBarItem(icon:  Icon(Icons.library_books),label: kLibrary),
      ],
    );
  }
}
