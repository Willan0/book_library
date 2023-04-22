import '../../../data/vos/books_vo/book_vo.dart';

abstract class BookDAO{

  void saveBook(List<Books> bookList);

  List<Books>? getBookFromDatabase();

  Stream watchBookBox();

  Stream<List<Books>?> getBookFromDatabaseStream();

  void clearBookBox();

}