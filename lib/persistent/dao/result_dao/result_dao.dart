

import '../../../data/vos/result_vo/result_vo.dart';

abstract class ResultDAO{

  void save(Results results);

  Stream watchBox();

  Results? getResults (String publishedDate);

  Stream<Results?> getResultsFromStream (String publishedDate);
}