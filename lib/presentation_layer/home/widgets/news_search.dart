import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:news/business_logic_layer/home_cubit.dart';
import 'package:news/data_layer/repository/base_repo.dart';

import '../../../data_layer/repository/remo_repo/remo_repo.dart';
import 'appBar.dart';

class NewsSearch extends SearchDelegate {


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            buildResults(context);
          },
          icon: Icon(Icons.search))
    ];
    // TODO: implement buildActions
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.clear,
          size: 30,
        ));
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return BlocProvider(
      create: (context) => HomeCubit(
          baseRepository: RemoteRepository()..getArticle(searchQuery: query)),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is ArticleLoading) {
            EasyLoading.show();
          } else if (state is ArticleSuccess) {
            EasyLoading.dismiss();
          }
        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, index) =>
                ArticleView(articles: cubit.articleList[index]),
            itemCount: cubit.articleList.length,
          );
        },
      ),
    );
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Text("sssss");
    throw UnimplementedError();
  }
}
