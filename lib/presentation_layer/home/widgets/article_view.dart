import 'package:flutter/material.dart';
import 'package:news/data_layer/model/article_model.dart';
import 'package:news/presentation_layer/news_description/news_discraption.dart';

class ArticleView extends StatelessWidget {
  Articles articles;

  ArticleView({
    super.key,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, NewsDescription.routeName,
            arguments: articles);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.network(articles.urlToImage ?? ""),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            articles.source?.name ?? "",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF79828B),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            articles.title ?? "",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF42505C),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
