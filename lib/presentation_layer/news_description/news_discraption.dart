import 'package:flutter/material.dart';
import 'package:news/data_layer/model/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDescription extends StatelessWidget {
  NewsDescription({
    super.key,
  });

  static String routeName = "News Desciption";

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var articles = ModalRoute.of(context)?.settings.arguments as Articles;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          articles.source!.name ?? "",
          style: theme.textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            style: const TextStyle(
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
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF42505C),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Text(
              articles.content ?? "",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF42505C),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                  onPressed: () {
                    openUrl(articles.url ?? "");
                  },
                  icon: const Text("View Full Article"),
                  label: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                  )),
            ],
          )
        ]),
      ),
    );
  }

  Future<void> openUrl(String? url) async {
    if (url == null) {
      return;
    }
    var uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    }
  }
}
