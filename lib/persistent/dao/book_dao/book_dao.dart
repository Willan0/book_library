import 'package:book_library/data/vos/books_vo/book_vo.dart';

abstract class BookDAO{
  void saveBook(String id,Books books);

  List? getKey();

  List<Books>? getBooks();

  void clearBox();

  Stream watchBookBox();

  Stream<List<Books>?> getBookFromStream();

  Stream<List?> getKeyFromStream();
  void deleteBook(String bookId);

}