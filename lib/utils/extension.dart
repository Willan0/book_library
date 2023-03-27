import 'package:book_library/bloc/bottom_nav_bloc.dart';
import 'package:book_library/bloc/home_page_bloc.dart';
import 'package:book_library/bloc/library_bloc.dart';
import 'package:book_library/bloc/search_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension ContextExtension on BuildContext{

  HomePageBloc getHomePageBlocInstance()=> read<HomePageBloc>();
  BottomNavigationBloc getBottomNavigationBlocInstance()=> read<BottomNavigationBloc>();
  LibraryBloc getLibraryBlocInstance()=> read<LibraryBloc>();
  SearchBloc getSearchBlocInstance()=> read<SearchBloc>();

  void nextScreen(context,widget){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context)=> widget)
    );
  }

  void previousScreen(context){
    Navigator.of(context).pop();
  }
}