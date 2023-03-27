
import 'package:book_library/data/vos/result_vo/result_vo.dart';
import 'package:flutter/cupertino.dart';

import '../data/data_apply/library_data_apply.dart';
import '../data/data_apply/library_data_apply_impl.dart';
import '../data/vos/books_vo/book_vo.dart';
import '../data/vos/lists_vo/lists_vo.dart';
import '../persistent/dao/book_dao/book_dao.dart';
import '../persistent/dao/book_dao/book_dao_impl.dart';


class HomePageBloc extends ChangeNotifier {

  // state variable
  final List<Books> _getBookList = [];
  List<Lists> _getListsList = [];
  Results? _getResults;
  bool _favourite = false;

  // getter
  List<Books> get getBookList => _getBookList;

  List<Lists> get getListsList => _getListsList;

  bool get getFavourite => _favourite;
  // state instance
  final LibraryDataApply _dataApply = LibraryDataApplyImpl();

  final BookDAO _bookDAO = BookDAOImpl();

  HomePageBloc(String publishedDate) {
    _dataApply.getResultFromNetwork(publishedDate);

    _dataApply.getResultFromDataBase(publishedDate).listen((event) {
      _getResults = event;
      if (_getResults != null) {
        _getListsList = _getResults?.lists ?? [];
        notifyListeners();
      }
    });
  }

  void save(){
      var lists = _getResults?.lists;
      var temp = lists?.map((element) {
        return element.books?.map((e) {
          e.isSelected = true;
          return e;
        }).toList();
      }).toList();
      List<Books> books =[];
      temp?.forEach((bookList) {
        bookList?.forEach((book) {
          books.add(book);
        });
      });
  }
}