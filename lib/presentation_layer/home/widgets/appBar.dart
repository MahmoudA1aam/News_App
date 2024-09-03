import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:news/business_logic_layer/home_cubit.dart';
import 'package:news/data_layer/model/article_model.dart';
import 'package:news/data_layer/repository/remo_repo/remo_repo.dart';

import '../../news_description/news_discraption.dart';

class BuildAppBar extends StatefulWidget {
  BuildAppBar({
    super.key,
    required this.searchController,
    required this.text,
  });

  bool isSearching = false;

  TextEditingController searchController;
  Text text;

  @override
  State<BuildAppBar> createState() => _BuildAppBarState();
}

class _BuildAppBarState extends State<BuildAppBar> {
  @override
  // List<String> myFilterItems(String query) {
  //   List<String> getSuggestions = [];
  //   getSuggestions.addAll(items);
  //   getSuggestions.retainWhere(
  //       (item) => item.toLowerCase().contains(query.toLowerCase()));
  //   return getSuggestions;
  //
  //   if (textSearch.isEmpty) {
  //     filteredItems = List.from(items);
  //   } else {
  //     filteredItems = items
  //         .where(
  //             (item) => item.toLowerCase().contains(textSearch.toLowerCase()))
  //         .toList();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => HomeCubit(baseRepository: RemoteRepository()),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Column(
            children: [
              Container(
                width: mediaQuery.width,
                height: mediaQuery.height * 0.10,
                decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
                child: widget.isSearching
                    ? Container(
                        margin: const EdgeInsets.only(
                            left: 40, right: 40, top: 30, bottom: 10),
                        child: TypeAheadField(
                          suggestionsCallback: (search) {
                            cubit.fetchArticle(
                                query: widget.searchController.text);
                          },
                          itemBuilder: (context, value) {
                            return ArticleView2(
                              articles: cubit.articleList[0],
                            );
                          },
                          onSelected: (value) {},
                          builder: (context, controller, focusNode) {
                            return TextField(
                              focusNode: focusNode,
                              style: const TextStyle(
                                color: Colors.black54,
                              ),
                              controller: widget.searchController,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Search Article",
                                  prefix: IconButton(
                                      onPressed: () {
                                        clearSearch();
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                        Icons.clear,
                                        color: Colors.black54,
                                        size: 30,
                                      )),
                                  hintStyle: const TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.circular(50))),
                            );
                          },
                        ))
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          widget.text,
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    startSearch(context);
                                  },
                                  icon: Icon(
                                    Icons.search,
                                    size: 30,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ],
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  void startSearch(BuildContext context) {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearching));
    setState(() {
      widget.isSearching = true;
    });
  }

  void stopSearching() {
    clearSearch();
    setState(() {
      widget.isSearching = false;
    });
  }

  void clearSearch() {
    setState(() {
      widget.searchController.clear();
    });
  }
}

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

class ArticleView2 extends StatelessWidget {
  Articles articles;

  ArticleView2({
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.network(
              articles.urlToImage ?? "",
              height: 100,
              width: 150,
            ),
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
