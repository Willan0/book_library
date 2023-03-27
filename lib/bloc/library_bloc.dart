import 'package:book_library/data/vos/books_vo/book_vo.dart';
import 'package:book_library/persistent/dao/book_dao/book_dao_impl.dart';
import 'package:flutter/material.dart';

import '../data/data_apply/library_data_apply.dart';
import '../data/data_apply/library_data_apply_impl.dart';
import '../data/vos/lists_vo/lists_vo.dart';
import '../persistent/dao/book_dao/book_dao.dart';
import '../persistent/dao/result_dao/result_dao.dart';
import '../persistent/dao/result_dao/result_dao_impl.dart';

class LibraryBloc extends ChangeNotifier{
  bool _isDispose = false;

  List<Lists> _getListsList = [];
  List<Books> _getBooksList = [];

  // getter
  List<Lists> get getListsList => _getListsList;
  List<Books> get getBooksList => _getBooksList;

  // state instance
  final LibraryDataApply _dataApply = LibraryDataApplyImpl();
  final BookDAO _bookDAO = BookDAOImpl();

  LibraryBloc(){
_dataApply.getBookFromDataBase().listen((event) {
  _getBooksList = event ??[];
  notifyListeners();
});
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