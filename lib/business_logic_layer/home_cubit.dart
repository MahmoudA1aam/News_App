import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news/data_layer/repository/base_repo.dart';

import '../data_layer/model/article_model.dart';
import '../data_layer/model/source_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.baseRepository}) : super(HomeInitial());
  List<Source> sourceList = [];
  List<Articles> articleList = [];
  int? selectedIndex;
  final BaseRepository baseRepository;

  static HomeCubit get(context) => BlocProvider.of(context);

  Future<void> fetchSources({required String categoryId}) async {
    var response = await baseRepository.getSource(categoryId);
    emit(SourceLoading());
    try {
      if (response.statusCode == 200 &&
          jsonDecode(response.body)["status"] == "ok") {
        SourceModel sourceModel =
            SourceModel.fromJson(jsonDecode(response.body));

        sourceList = sourceModel.sources;
        emit(SourceSuccess());
      }
    } on Exception catch (e) {
      emit(SourceError());
      // TODO
    }
  }

  Future<void> fetchArticle({String? query}) async {
    var response = await baseRepository.getArticle(
        sourceID: sourceList[selectedIndex!].id, searchQuery: query);
    print("object=${sourceList[selectedIndex!].id}");
    emit(ArticleLoading());
    try {
      if (response.statusCode == 200 &&
          jsonDecode(response.body)["status"] == "ok") {
        var articleModel = ArticalsModel.fromJson(jsonDecode(response.body));
        articleList = articleModel.articles ?? [];

        emit(ArticleSuccess());
      } else {
        emit(ArticleError());
      }
    } on Exception catch (e) {
      emit(ArticleError());
      // TODO
    }
  }

  changeIndex(int index) {
    emit(HomeInitial());
    selectedIndex = index;
    emit(ChangedIndex());
  }
}
