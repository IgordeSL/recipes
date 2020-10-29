import 'package:recipes/models/meal.dart';
import 'package:recipes/pages/meal_detail_page.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    Key key,
    @required this.meal,
  }) : super(key: key);

  final Meal meal;

  String get mealComplexity {
    switch (meal.complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
      default:
        return '';
    }
  }

  String get mealAffordability {
    switch (meal.affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.pricey:
        return 'Pricey';
      case Affordability.luxurious:
        return 'Luxurious';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelectMeal(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: ListTile(
          title: Text(
            meal.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          leading: SizedBox(
            height: 64,
            width: 64,
            child: Hero(
              tag: '${meal.id}image',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  meal.imageURL,
                  fit: BoxFit.cover,
                  loadingBuilder: (ctx, child, progress) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      layoutBuilder: (currentChild, previousChildren) => Stack(
                        fit: StackFit.expand,
                        children: [
                          ...previousChildren,
                          if (currentChild != null) currentChild,
                        ],
                      ),
                      child: progress == null
                          ? child
                          : Center(
                              child: CircularProgressIndicator(
                                value: progress.expectedTotalBytes != null
                                    ? progress.cumulativeBytesLoaded /
                                        progress.expectedTotalBytes
                                    : null,
                              ),
                            ),
                    );
                  },
                ),
              ),
            ),
          ),
          subtitle: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.schedule,
                size: 14,
              ),
              SizedBox(
                width: 4,
              ),
              Text('${meal.duration} min'),
              SizedBox(
                width: 8,
              ),
              Icon(
                Icons.restaurant_menu,
                size: 14,
              ),
              SizedBox(
                width: 4,
              ),
              Text('$mealComplexity'),
              SizedBox(
                width: 8,
              ),
              Icon(
                Icons.attach_money,
                size: 14,
              ),
              Text('$mealAffordability'),
            ],
          ),
        ),
      ),
    );
  }

  void onSelectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailPage.routeName,
      arguments: meal.id,
    );
  }
}
