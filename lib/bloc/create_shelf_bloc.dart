
import 'package:flutter/material.dart';

import '../data/data_apply/library_data_apply.dart';
import '../data/data_apply/library_data_apply_impl.dart';

class CreateShelfBloc extends ChangeNotifier{
  // state variable
  bool _isDispose = false;
  final TextEditingController _shelfController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  // getter
  TextEditingController get getShelfController => _shelfController;
  GlobalKey<FormState> get getGlobalKey => _globalKey;

  // state instance
  final LibraryDataApply _dataApply = LibraryDataApplyImpl();


  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    if(!_isDispose){
      super.notifyListeners();
    }
  }
  void createShelf(){
    var shelfName = _shelfController.text.toString();
    _dataApply.createShelf(shelfName);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _isDispose = true;
  }
}