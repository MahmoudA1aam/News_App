import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/core/constants.dart';

import 'package:news/data_layer/model/source_model.dart';

import '../../data_layer/model/article_model.dart';

class ApiManager {
  static Future<SourceModel> fetchSources({required String categoryId}) async {
    Map<String, dynamic>? queryParameters = {
      "apiKey": Constants.apiKey,
      "category": categoryId,
    };

    Uri uri = Uri.https(
      Constants.baseUrl,
      "/v2/top-headlines/sources",
      queryParameters,
    );

    var response = await http.get(uri);

    SourceModel sourceModel = SourceModel.fromJson(jsonDecode(response.body));

    print(response.body);

    return sourceModel;
  }


  static Future<ArticalsModel> fetchArtical(String sourceId) async {
    Map<String, dynamic>? queryParameters = {
      "apiKey": Constants.apiKey,
      "sources": sourceId
    };

    Uri uri = Uri.https(Constants.baseUrl, "/v2/everything", queryParameters);
    final response = await http.get(uri);

    if (response.statusCode == 200 &&
        jsonDecode(response.body)["status"] == "ok") {
      var articleModel = ArticalsModel.fromJson(jsonDecode(response.body));
      return articleModel;
    } else {
      throw Expando("failed to load source");
    }
  }
}
