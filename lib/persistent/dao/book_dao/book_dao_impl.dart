import 'package:book_library/data/vos/books_vo/book_vo.dart';
import 'package:book_library/persistent/dao/book_dao/book_dao.dart';
import 'package:hive/hive.dart';

import '../../../constant/dao_constant.dart';

class BookDAOImpl extends BookDAO{
  @override
  void deleteBook(int bookId) => _getBookBox.delete(bookId);

  @override
  Stream<List<Books>?> getBookFromStream() =>Stream.value(getBooks());

  @override
  List<Books> getBooks()=> _getBookBox.values.toList();

  @override
  void saveBook(Books books) {
     _getBookBox.put(books.primaryIsbn10, books);
  }

  @override
  Stream watchBookBox()=> _getBookBox.watch();

  final Box<Books> _getBookBox = Hive.box<Books>(kBoxNameForBook);

}