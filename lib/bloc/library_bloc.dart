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


  List<Books>? _getBooksList = [];
  List? _getListName = [];

  List<Lists>? _getListList = [];
  // getter
  List? get getListName => _getListName;
  List<Books>? get getBooksList => _getBooksList;
  List<Lists>? get getListsList => _getListList;

  // state instance
  final LibraryDataApply _dataApply = LibraryDataApplyImpl();
  final BookDAO _bookDAO = BookDAOImpl();
  final ResultDAO _resultDAO = ResultDAOImpl();

  LibraryBloc(){
    // List<Lists>? lists = [];
    // var temp = _dataApply.getKey();
    // if(temp!= null){
    //   for(var key in temp){
    //     _bookDAO.getBookFromStream(key).listen((event) {
    //       _getBooksList = event ?? [];
    //       notifyListeners();
    //       print(_getBooksList);
    //     });
    //   }
    // }
    // var listName = temp?.map((key) {
    //   String s = key;
    //   return s.split(',').first;
    // }).toList().toSet();
    // if (listName == null) {
    //   _getListName = null;
    // } else if (listName.isEmpty) {
    //   _getListName = [];
    // } else {
    //   _getListName = listName.toList();
    // }
    //
    // print(_getBooksList);
    // for(var name in listName!){
    //   Lists list = Lists(listName: name,books: _getBooksList);
    //   lists.add(list);
    // }
    // _getListList = lists;
    // notifyListeners();
    Lists lists ;
    List<Lists>? listList =[];
    _dataApply.getBookFromDataBase().listen((event) {
      _getBooksList = event ?? [];
      notifyListeners();
    });
    _dataApply.getKeyFromDataBase().listen((event) {
     var temp  = event ?? [];
     notifyListeners();
     var set = temp.map((e) {
       String s = e;
       return s.split(',').first;
     }).toSet();
     var check = temp.map((e) {
       String s = e;
       return s.split(',').last;
     }).toList();
     _getListName = set.toList();
     for(int i = 0; i<check.length ;i++){
       lists = Lists(listName: _getListName?[i],books: _getBooksList?.where((element) => element.title == check[i]).toList());
       listList.add(lists);
       _getListList = listList;
       notifyListeners();
     }
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