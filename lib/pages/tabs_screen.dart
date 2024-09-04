import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/pages/categories_screem.dart';
import 'package:meals/pages/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsScreen({
    super.key,
    required this.favoriteMeals,
  });

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  late List<Map<String, Object>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Categorias',
        'screen': const CategoriesScreen(),
      },
      {
        'title': 'Meus favoritos',
        'screen': FavoriteScreen(
          favoriteMeals: widget.favoriteMeals,
        )
      },
    ];
  }

  _selectedScree(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pink,
        title: Text(
          _screens[_selectedScreenIndex]['title'] as String,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      drawer: const MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.amber,
          backgroundColor: Colors.pink,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedScreenIndex,
          onTap: _selectedScree,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              label: 'Categorias',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              label: 'Favorito',
            ),
          ]),
    );
  }
}
