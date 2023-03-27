import 'package:book_library/constant/api_constant.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../response/library_response/library_response.dart';

part 'library_api.g.dart';
@RestApi(baseUrl: libraryBaseUrl)
abstract class LibraryApi{

  factory LibraryApi(Dio dio)= _LibraryApi;
 @GET(allBookEndPoint)
 Future<LibraryResponse> getLibraryResponse(
     @Query(kApikey) String apiKey,
     @Query(kPublishedDateQueryParam) String publishedDate
     );
}