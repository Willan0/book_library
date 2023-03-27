
import 'package:book_library/constant/dao_constant.dart';
import 'package:book_library/data/vos/result_vo/result_vo.dart';
import 'package:book_library/persistent/dao/result_dao/result_dao.dart';
import 'package:hive/hive.dart';

class ResultDAOImpl extends ResultDAO{
  ResultDAOImpl._();
  static final ResultDAOImpl _singleton = ResultDAOImpl._();
  factory ResultDAOImpl() => _singleton;

  final Box<Results> _getResultBox = Hive.box<Results>(kResultBox);

  @override
  Results? getResults(String publishedDate) {
    return _getResultBox.get(publishedDate);
  }


  @override
  void save(Results results) {
    _getResultBox.put(results.publishedDate, results);
  }

  @override
  Stream watchBox() => _getResultBox.watch();

  @override
  Stream<Results?> getResultsFromStream(String publishedDate) =>Stream.value(getResults(publishedDate));

  // @override
  // List<Books>? getBookList(String displayName, String bookName) {
  //   var result = _getResultBox.get('$displayName$bookName');
  //   var temp = result?.lists;
  //   List<Books>? book ;
  //   temp?.forEach((element) {
  //     book = element.books;
  //   });
  //   return book;
  // }

  // @override
  // Stream<List<Books>?> getBooksFromStream(String displayName, String bookName)
  // =>
  //     Stream.value(getBookList(displayName, bookName));




}