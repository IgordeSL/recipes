import 'package:recipes/models/meal.dart';
import 'package:recipes/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealsPage extends StatelessWidget {
  static const routeName = "/category";

  final List<Meal> availableMeals;

  CategoryMealsPage({@required this.availableMeals});

  @override
  Widget build(BuildContext context) {
    var routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    String categoryTitle = routeArgs['title'];
    String categoryId = routeArgs['id'];
    List<Meal> categoryMeals = availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Scrollbar(
        child: ListView.builder(
          padding: EdgeInsets.only(
            top: 16,
          ),
          itemBuilder: (ctx, index) {
            return Column(
              children: <Widget>[
                MealItem(meal: categoryMeals[index]),
                if (index < categoryMeals.length - 1)
                  Divider(
                    height: 1,
                    indent: 88,
                    endIndent: 16,
                  ),
              ],
            );
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
