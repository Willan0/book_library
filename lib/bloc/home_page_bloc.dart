

import 'package:flutter/cupertino.dart';

import '../data/data_apply/library_data_apply.dart';
import '../data/data_apply/library_data_apply_impl.dart';
import '../data/vos/books_vo/book_vo.dart';
import '../data/vos/lists_vo/lists_vo.dart';
import '../persistent/dao/list_dao/list_dao_impl.dart';



class HomePageBloc extends ChangeNotifier {
bool _isDispose= false;
  // state variable
  List<Lists> _getListsList = [];
  List<Books> _getTapBooks =[];


  // getter

  List<Lists> get getListsList => _getListsList;
  List<Books> get getTapBooks => _getTapBooks;

  // state instance
  final LibraryDataApply _dataApply = LibraryDataApplyImpl();

  final ListDAOImpl _listDAO = ListDAOImpl();


  HomePageBloc(String publishedDate) {

    _dataApply.clearBookBox();

    _dataApply.getBookFromDatabaseStream().listen((event) {
      if(event!=null && event.isNotEmpty){
        _getTapBooks = event;
        notifyListeners();
      }
    });

    _dataApply.getListsListFromNetwork(publishedDate);

    _dataApply.getListsFromDataBaseStream().listen((event) {
      if(event != null && event.isNotEmpty ){
        _getListsList = event;
        notifyListeners();
      }
    });
  }

  void onTapFavorite(String listName,Books book){
    final favouriteList = _listDAO.listBox.get(listName);

    if(favouriteList !=null){
      List<Books> favouriteBooks = favouriteList.books ?? [];
      for(var favouriteBook in favouriteBooks){
        if(favouriteBook.title == book.title){
          favouriteBook.isSelected = !(favouriteBook.isSelected ?? false);
        }
      }
      _listDAO.saveLists(_getListsList);
    }
  }

  void onTapBook(Books book,String listName){
    book.myListName = listName;
    _dataApply.saveBook(book);
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