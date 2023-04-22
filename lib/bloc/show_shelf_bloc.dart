import 'package:book_library/data/data_apply/library_data_apply.dart';
import 'package:book_library/data/data_apply/library_data_apply_impl.dart';
import 'package:book_library/data/vos/books_vo/book_vo.dart';
import 'package:flutter/cupertino.dart';

import '../data/vos/shelf_vo/shelf_vo.dart';
import '../persistent/dao/shelf_dao/shelf_dao_impl.dart';

class ShowShelfBloc extends ChangeNotifier{

  // state variable
  bool _isDispose = false;
  List<ShelfVO>? _shelfList;


  // getter
  List<ShelfVO>? get getShelfList => _shelfList;

  // state instance
  final LibraryDataApply _dataApply = LibraryDataApplyImpl();
  final ShelfDAOImpl _shelfDAOImpl = ShelfDAOImpl();


  ShowShelfBloc(Books books){
    _dataApply.getShelfFromDataBaseStream().listen((event) {
      _shelfList = event ?? [];
      notifyListeners();
    });

  }


  void addBookToShelf(ShelfVO shelfVO,Books books){
    shelfVO.bookList.add(books);
    _shelfDAOImpl.saveShelf(shelfVO);
    notifyListeners();
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