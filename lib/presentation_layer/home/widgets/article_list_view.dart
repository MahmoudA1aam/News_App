import 'package:flutter/material.dart';
import 'package:news/core/network_layer/api_manager.dart';
import 'package:news/data_layer/model/article_model.dart';

import 'article_view.dart';

class ArticleListView extends StatelessWidget {
  ArticleListView({super.key, required this.sourceId});

  String sourceId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticalsModel>(
      future: ApiManager.fetchArtical(sourceId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          List<Articles> articleList = snapshot.data?.articles ?? [];
          return Expanded(
              child: ListView.builder(
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, index) =>
                ArticleView(articles: articleList[index]),
            itemCount: 10,
          ));
        }
      },
    );
  }
}
