import 'package:flutter/material.dart';
import 'package:news/data_layer/model/category_model.dart';

import '../../../core/network_layer/api_manager.dart';
import '../../../data_layer/model/source_model.dart';
import '../news_details_view.dart';

class NewsView extends StatelessWidget {
  final CategoryModel categoryModel;

  const NewsView({
    super.key,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return NewsDetailsView(
      categoryModel: categoryModel,
    );
  }
}