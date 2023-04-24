import '../../../data/vos/books_vo/book_vo.dart';

abstract class BookDAO{

  void saveBook(Books book);

  List<Books>? getBookFromDatabase();

  Stream watchBookBox();

  Stream<List<Books>?> getBookFromDatabaseStream();

  void clearBookBox();

}