import 'package:recipes/models/meal.dart';
import 'package:recipes/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesPage({@required this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.length == 0
        ? Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.favorite_border,
                size: 48,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  'No favorites yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Text('Start adding some')
            ],
          ))
        : Scrollbar(
            child: ListView.builder(
              padding: EdgeInsets.only(
                top: 16,
              ),
              itemBuilder: (ctx, index) {
                return Column(
                  children: <Widget>[
                    MealItem(meal: favoriteMeals[index]),
                    if (index < favoriteMeals.length - 1)
                      Divider(
                        height: 1,
                        indent: 88,
                        endIndent: 16,
                      ),
                  ],
                );
              },
              itemCount: favoriteMeals.length,
            ),
          );
  }
}
