import 'package:book_library/data/vos/books_vo/book_vo.dart';
import 'package:flutter/cupertino.dart';

class BottomNavigationBloc extends ChangeNotifier{

  // state variable
  bool _isDispose = false;
  int _index = 0;

  // getter
  int get getIndex => _index;


  void changePage(int index){
    _index = index;
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