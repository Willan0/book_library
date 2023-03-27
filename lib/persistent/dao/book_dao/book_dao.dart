import 'package:book_library/data/vos/books_vo/book_vo.dart';

abstract class BookDAO{
  void saveBook(Books books);

  List<Books> getBooks();

  Stream watchBookBox();

  Stream<List<Books>?> getBookFromStream();

  void deleteBook(int bookId);

}