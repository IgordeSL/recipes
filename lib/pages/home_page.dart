import 'package:recipes/models/meal.dart';
import 'package:recipes/pages/categories_page.dart';
import 'package:recipes/pages/favorites_page.dart';
import 'package:recipes/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final List<Meal> favoriteMeals;

  HomePage({@required this.favoriteMeals});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  _selectPage(int index) {
    if (index != _selectedPageIndex) {
      setState(() {
        _selectedPageIndex = index;
      });
    }
  }

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesPage(),
        'title': 'Categories',
      },
      {
        'page': FavoritesPage(
          favoriteMeals: widget.favoriteMeals,
        ),
        'title': 'Favorites',
      },
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedSwitcher(
          duration: const Duration(milliseconds: 100),
          switchInCurve: const Interval(0.5, 1),
          switchOutCurve: const Interval(0.5, 1),
          child: Align(
            alignment: Alignment.centerLeft,
            key: UniqueKey(),
            child: Text(
              _pages[_selectedPageIndex]['title'],
            ),
          ),
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _pages[_selectedPageIndex]['page'],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorites'),
          ),
        ],
        onTap: _selectPage,
      ),
      drawer: MainDrawer(),
    );
  }
}
