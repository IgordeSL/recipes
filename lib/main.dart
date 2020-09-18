import 'package:recipes/models/dummy-data.dart';
import 'package:recipes/models/meal.dart';
import 'package:recipes/pages/category_meals_page.dart';
import 'package:recipes/pages/filters_page.dart';
import 'package:recipes/pages/home_page.dart';
import 'package:recipes/pages/meal_detail_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(RecipesApp());

class RecipesApp extends StatefulWidget {
  @override
  _RecipesAppState createState() => _RecipesAppState();
}

class _RecipesAppState extends State<RecipesApp> {
  Map<String, bool> _filters = {
    'glutenFree': false,
    'vegetarian': false,
    'vegan': false,
    'lactoseFree': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (!meal.isGlutenFree && _filters['glutenFree']) {
          return false;
        }
        if (!meal.isVegetarian && _filters['vegetarian']) {
          return false;
        }
        if (!meal.isVegan && _filters['vegan']) {
          return false;
        }
        if (!meal.isLactoseFree && _filters['lactoseFree']) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavoriteMeal(String mealId) {
    var index = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (index >= 0) {
      setState(() {
        _favoriteMeals.removeAt(index);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'recipes',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amberAccent,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        splashColor: Colors.amberAccent.withOpacity(0.5),
        fontFamily: 'RobotoCondensed',
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyText2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          headline1: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
          ),
          headline3: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
          ),
          headline5: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            headline6: TextStyle(
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      routes: {
        '/': (ctx) => HomePage(
              favoriteMeals: _favoriteMeals,
            ), // Default
        CategoryMealsPage.routeName: (ctx) => CategoryMealsPage(
              availableMeals: _availableMeals,
            ),
        MealDetailPage.routeName: (ctx) => MealDetailPage(
              toggleFavorite: _toggleFavoriteMeal,
              isFavorite: (mealId) => !_favoriteMeals.every(
                (meal) => meal.id != mealId,
              ),
            ),
        FiltersPage.routeName: (ctx) => FiltersPage(
              currentFilters: _filters,
              onSave: _setFilters,
            ),
      },
    );
  }
}
