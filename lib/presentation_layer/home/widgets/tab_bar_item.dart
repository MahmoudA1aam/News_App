import 'package:flutter/material.dart';

class TabBarItem extends StatelessWidget {
  final String title;
  bool selected;

  TabBarItem({
    super.key,
    required this.title,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      width: 120,
      height: 40,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
      decoration: BoxDecoration(
        color: selected ? theme.colorScheme.primary : Colors.white,
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 2,
        ),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: selected ? Colors.white : theme.colorScheme.primary,
        ),
      ),
    );
  }
}