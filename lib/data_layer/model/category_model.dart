import 'dart:ui';

class CategoryModel {
  final String categoryId, categoryImage, categoryTitle;
  final Color categoryColor;

  CategoryModel(
      {required this.categoryId,
      required this.categoryImage,
      required this.categoryTitle,
      required this.categoryColor});
}
