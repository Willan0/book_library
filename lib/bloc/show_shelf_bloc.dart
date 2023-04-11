import 'package:book_library/data/data_apply/library_data_apply.dart';
import 'package:book_library/data/data_apply/library_data_apply_impl.dart';
import 'package:flutter/cupertino.dart';

import '../data/vos/shelf_vo/shelf_vo.dart';

class ShowShelfBloc extends ChangeNotifier{

  // state variable
  bool _isDispose = false;
  List<ShelfVO>? _shelfList;

  // getter
  List<ShelfVO>? get getShelfList => _shelfList;

  // state instance
  final LibraryDataApply _dataApply = LibraryDataApplyImpl();


  ShowShelfBloc(){
    _dataApply.getShelfFromDataBase().listen((event) {
      _shelfList = event ?? [];
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