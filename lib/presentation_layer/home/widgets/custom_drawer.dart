import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.onCategoryClicked});

  final Function onCategoryClicked;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Container(
      width: mediaQuery.width * 0.7,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: mediaQuery.width * 0.7,
            height: mediaQuery.height * 0.146,
            color: theme.colorScheme.primary,
            child: Text(
              "News App!",
              style: theme.textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.menu,
                      size: 28,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        onCategoryClicked();
                      },
                      child: Text(
                        "Categories",
                        style: theme.textTheme.bodyLarge,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.settings,
                      size: 28,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Settings",
                        style: theme.textTheme.bodyLarge,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
