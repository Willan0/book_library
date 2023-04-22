
import 'package:book_library/data/vos/books_vo/book_vo.dart';
import 'package:book_library/persistent/dao/book_dao/book_dao.dart';
import 'package:hive/hive.dart';

import '../../../constant/dao_constant.dart';

class BookDAOImpl extends BookDAO{

  BookDAOImpl._();
  static final BookDAOImpl _singleton= BookDAOImpl._();
  factory BookDAOImpl() => _singleton;

  final Box<Books> _getBookBox = Hive.box<Books>(kBoxNameForBook);

  @override
  List<Books>? getBookFromDatabase() {
    List<Books>? books = _getBookBox.values.toList();
    books.sort((a, b) => b.order!.compareTo(a.order!),);
    return books;
  }

  @override
  Stream<List<Books>?> getBookFromDatabaseStream() => Stream.value(getBookFromDatabase());

  @override
  void saveBook(List<Books> bookList) {
    int order = 0;
    final temp = getBookFromDatabase();
    if(temp!=null && temp.isNotEmpty){
        order = temp.last.order!;
    }
    for(Books book in bookList){
      order++;
      book.order = order;
      _getBookBox.put(book.title, book);
    }
  }

  @override
  Stream watchBookBox() => _getBookBox.watch();

  @override
  void clearBookBox() {
    var books = _getBookBox.values.toList();
    for(var book in books){
      _getBookBox.delete(book.title);
    }
  }

}