import 'package:flutter/material.dart';

import 'package:news/data_layer/model/category_model.dart';

import 'package:news/presentation_layer/home/widgets/category_item.dart';
import 'package:news/presentation_layer/home/widgets/custom_drawer.dart';
import 'package:news/presentation_layer/home/widgets/news_search.dart';

import 'news_details_view.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  static String routeName = "homeView";
  bool isSearching = true;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController searchController = TextEditingController();
  String textSearch = '';

  List<String> filteredItems = [];
  bool listActive = false;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<CategoryModel> category = [
      CategoryModel(
          categoryId: "sports",
          categoryImage: "assets/images/sports.png",
          categoryTitle: "Sports",
          categoryColor: const Color(0xFFC91C22)),
      CategoryModel(
          categoryId: "general",
          categoryImage: "assets/images/Politics.png",
          categoryTitle: "Politics",
          categoryColor: const Color(0xFF003E90)),
      CategoryModel(
          categoryId: "health",
          categoryImage: "assets/images/health.png",
          categoryTitle: "Health",
          categoryColor: const Color(0xFFED1E79)),
      CategoryModel(
          categoryId: "business ",
          categoryImage: "assets/images/bussines.png",
          categoryTitle: "Business ",
          categoryColor: const Color(0xFFCF7E48)),
      CategoryModel(
          categoryId: "environment ",
          categoryImage: "assets/images/environment.png",
          categoryTitle: "Environment ",
          categoryColor: const Color(0xFF4882CF)),
      CategoryModel(
          categoryId: "science ",
          categoryImage: "assets/images/science.png",
          categoryTitle: "Science",
          categoryColor: const Color(0xFFF2D352)),
    ];

    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/pattern.png",
                ),
                fit: BoxFit.cover)),
        child: Scaffold(
          drawer: CustomDrawer(onCategoryClicked: onDrawerCategoryClicked),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white, size: 35),
              title: Text(
                selectedCategory == null
                    ? "News App"
                    : selectedCategory!.categoryTitle,
                style: theme.textTheme.titleMedium,
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      
                      showSearch(context: context, delegate: NewsSearch());
                    },
                    icon: Icon(
                      Icons.search,
                      size: 30,
                    ))
              ]),
          body: selectedCategory == null
              ? Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Pick your category\nof interest",
                      textAlign: TextAlign.left,
                      style: theme.textTheme.titleMedium!
                          .copyWith(color: const Color(0xFF4F5A69)),
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.only(top: 20),
                        itemCount: category.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                                childAspectRatio: 9 / 11,
                                crossAxisCount: 2),
                        itemBuilder: (context, index) => CategoryItem(
                            categoryModel: category[index],
                            index: index,
                            itemClick: onCategoryItemClick),
                      ),
                    )
                  ],
                ),
              )
              : NewsDetailsView(categoryModel: selectedCategory!),
        ));
  }

  CategoryModel? selectedCategory;

  onCategoryItemClick(CategoryModel categoryModel) {
    selectedCategory = categoryModel;

    setState(() {});
  }

  onDrawerCategoryClicked() {
    setState(() {
      selectedCategory = null;
      Navigator.pop(context);
    });
  }

  onChanged(String value) {
    setState(() {
      textSearch = value;
    });
  }
}
