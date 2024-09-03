import 'package:http/http.dart';

abstract class BaseRepository {
  Future<Response> getSource(String categoryId);

  Future<Response> getArticle({String? sourceID,String? searchQuery});
}
