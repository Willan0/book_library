import 'package:flutter/material.dart';

import '../data/data_apply/library_data_apply.dart';
import '../data/data_apply/library_data_apply_impl.dart';
import '../data/vos/item_vo/item_vo.dart';

class SearchBloc extends ChangeNotifier{


  // state variable
  List<ItemVO>? _getItemVO = [];
  List<String>? _getSearchHistory = [];
  bool _isSearching = false;
  String _history = '';
  TextEditingController _searchController = TextEditingController();

  // getter
  List<ItemVO>? get getItemList => _getItemVO;
  List<String>? get getSearchHistory => _getSearchHistory;
  String get getHistory => _history;
  bool get getIsSearching => _isSearching;
  TextEditingController get getSearchEditingController => _searchController;
  // state instance

  final LibraryDataApply _dataApply = LibraryDataApplyImpl();

  SearchBloc(){
    final list = _dataApply.getSearchHistoryList();
    if (list == null) {
      _getSearchHistory = null;
    } else if (list.isEmpty) {
      _getSearchHistory = [];
    } else {
      _getSearchHistory = list;
    }
    notifyListeners();
  }


  void search(text){
    _isSearching = true;
    notifyListeners();
    _dataApply.getItemListFromNetwork(text).then((value) {
      if(value!=null){
        _getItemVO = value;
        notifyListeners();
      }
    }).whenComplete(() {
      _isSearching = false;
      notifyListeners();
    });
  }

  void saveHistory(text){
    _dataApply.saveSearchHistory(text);
  }

  void searchByHistory(text){
    _history = text;

    _searchController = TextEditingController(text: _history);
    search(text);
    notifyListeners();
  }


}