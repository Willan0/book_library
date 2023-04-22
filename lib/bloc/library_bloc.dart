
import 'package:flutter/material.dart';

import '../data/data_apply/library_data_apply.dart';
import '../data/data_apply/library_data_apply_impl.dart';
import '../data/vos/books_vo/book_vo.dart';
import '../data/vos/lists_vo/lists_vo.dart';
import '../persistent/dao/list_dao/list_dao_impl.dart';



class LibraryBloc extends ChangeNotifier{
  bool _isDispose = false;




  List<Lists> _favouriteList = [];
  // getter

  List<Lists> get getFavouriteList => _favouriteList;

  // state instance
  final LibraryDataApply _dataApply = LibraryDataApplyImpl();
  final ListDAOImpl _listDAO = ListDAOImpl();


  LibraryBloc(){
    _dataApply
        .getListsFromDataBaseStream().listen((event) {
      if(event!=null && event.isNotEmpty){
        _favouriteList = event;
        notifyListeners();
      }

    });
  }

  void onTapFavorite(String listName,Books book){
    final favouriteList = _listDAO.listBox.get(listName);
    if(favouriteList !=null){
      var favouriteBooks = favouriteList.books ?? [];
      for(var favouriteBook in favouriteBooks){
        if(favouriteBook.title == book.title){
          favouriteBook.isSelected = !(favouriteBook.isSelected ?? false);
        }
      }
      _listDAO.saveLists(_favouriteList);
    }
  }
  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    if(!_isDispose){
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _isDispose = true;
  }
}