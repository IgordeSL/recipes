import 'package:recipes/widgets/category_item.dart';
import 'package:recipes/models/category.dart';
import 'package:recipes/models/dummy_data.dart';
import 'package:recipes/pages/category_meals_page.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  void _onSelectCategoryItem(BuildContext context, Category category) {
    Navigator.of(context).pushNamed(
      CategoryMealsPage.routeName,
      arguments: {
        'id': category.id,
        'title': category.title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: GridView(
        padding: EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 240,
          childAspectRatio: 2 / 1,
        ),
        children: DUMMY_CATEGORIES.map(
          (category) {
            return CategoryItem(
              category: category,
              onSelectItem: () {
                _onSelectCategoryItem(
                  context,
                  category,
                );
              },
            );
          },
        ).toList(),
      ),
    );
  }
}
