import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:news/data_layer/repository/remo_repo/remo_repo.dart';

import 'package:news/data_layer/model/category_model.dart';

import 'package:news/presentation_layer/home/widgets/article_view.dart';
import 'package:news/presentation_layer/home/widgets/tab_bar_item.dart';

import '../../business_logic_layer/home_cubit.dart';

class NewsDetailsView extends StatefulWidget {
  const NewsDetailsView({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  State<NewsDetailsView> createState() => _NewsDetailsViewState();
}

class _NewsDetailsViewState extends State<NewsDetailsView> {
  @override
  // void initState() {
  //   viewModel = HomeProvider();
  //   Future.wait([viewModel.getSources(widget.categoryModel.categoryId)])
  //       .then((value) {
  //     if (value[0] == true) {
  //       return viewModel
  //           .getArticles(viewModel.sourcesList[viewModel.selectedIndex].id);
  //     }
  //   });
  //
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(baseRepository: RemoteRepository())
        ..fetchSources(categoryId: widget.categoryModel.categoryId),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is SourceLoading || state is ArticleLoading) {
            EasyLoading.show();
          } else if (state is SourceSuccess || state is ArticleSuccess) {
            EasyLoading.dismiss();
          }
        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return DefaultTabController(
            length: cubit.sourceList.length,
            child: Column(children: [
              if (cubit.sourceList.isNotEmpty)
                TabBar(
                  labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                  indicator: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide.none,
                    ),
                  ),
                  isScrollable: true,
                  onTap: (int index) {
                    cubit.changeIndex(index);

                    cubit.fetchArticle();
                  },
                  tabs: cubit.sourceList
                      .map((e) => TabBarItem(
                            title: e.name,
                            selected: cubit.selectedIndex ==
                                cubit.sourceList.indexOf(e),
                          ))
                      .toList(),
                ),
              Expanded(
                  child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemBuilder: (context, index) =>
                    ArticleView(articles: cubit.articleList[index]),
                itemCount: cubit.articleList.length,
              ))
              // ArticleListView(sourceId: viewModel.sourcesList[vm.selectedIndex].id)
            ]),
          );
        },
      ),
    );
  }
}
