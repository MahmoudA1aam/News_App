import 'package:flutter/material.dart';
import 'package:news/data_layer/model/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.categoryModel,
      required this.index,
      required this.itemClick});

  final CategoryModel categoryModel;
  final int index;
  final Function itemClick;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        itemClick(categoryModel);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(25),
                topRight: const Radius.circular(25),
                bottomRight: index % 2 == 0
                    ? const Radius.circular(0)
                    : const Radius.circular(25),
                bottomLeft: index % 2 == 0
                    ? const Radius.circular(25)
                    : const Radius.circular(0)),
            color: categoryModel.categoryColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(categoryModel.categoryImage),
            Text(
              categoryModel.categoryTitle,
              style: theme.textTheme.titleMedium,
            )
          ],
        ),
      ),
    );
  }
}
