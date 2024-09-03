
import 'package:news/data_layer/repository/base_repo.dart';

import '../../../core/constants.dart';
import 'package:http/http.dart' as http;

class RemoteRepository extends BaseRepository {
  @override
  Future<http.Response> getArticle({String? sourceID, String? searchQuery}) {
    // TODO: implement getArticle
    Map<String, dynamic>? queryParameters = {
      "apiKey": Constants.apiKey,
      "sources": sourceID,
      "q":searchQuery
    };

    Uri uri = Uri.https(Constants.baseUrl, "/v2/everything", queryParameters);
    return http.get(uri);


  }

  @override
  Future<http.Response> getSource(String categoryId) {
    // TODO: implement getSource
    Map<String, dynamic> parameters = {
      "apiKey": Constants.apiKey,
      "category": categoryId
    };
    Uri uri =
        Uri.https(Constants.baseUrl, "/v2/top-headlines/sources", parameters);
    return http.get(uri);
    throw UnimplementedError();
  }
}
