import 'package:flutter/material.dart';
import 'package:meals/dummy_data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/pages/categories_meals_screem.dart';
import 'package:meals/pages/meal_details_screen.dart';
import 'package:meals/pages/settings_screen.dart';
import 'package:meals/pages/tabs_screen.dart';
import 'package:meals/utils/app_routes.dart';

void main() => runApp(const MealsApp());

class MealsApp extends StatefulWidget {
  const MealsApp({super.key});

  @override
  State<MealsApp> createState() => _MealsAppState();
}

class _MealsAppState extends State<MealsApp> {
  Settings settings = Settings();

  List<Meal> _availableMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    this.settings = settings;
    _availableMeals = dummyMeals.where((meal) {
      final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
      final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
      final filterVegan = settings.isVegan && !meal.isVegan;
      final filterVegeterian = settings.isVegetarian && !meal.isVegetarian;
      return !filterVegeterian &&
          !filterLactose &&
          !filterGluten &&
          !filterVegan;
    }).toList();
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: ThemeData().textTheme.copyWith(
              headlineSmall: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
        colorScheme: ThemeData().colorScheme.copyWith(
            background: const Color.fromRGBO(255, 254, 229, 1),
            secondary: Colors.amber,
            primary: Colors.pink),
      ),
      // .copyWith(
      //   backgroundColor: ,
      //   colorScheme: ThemeData().colorScheme.copyWith(
      //         primary: Colors.grey,
      //         background: const Color.fromRGBO(255, 254, 229, 1),
      //       ),
      // ),
      routes: {
        AppRoutes.home: (context) => TabsScreen(favoriteMeals: _favoriteMeals),
        AppRoutes.categoriesMeals: (context) =>
            CategoriesMealsScreen(meals: _availableMeals),
        AppRoutes.mealDetails: (context) => MealDetailScreen(
            onToggleFavorite: _toggleFavorite, isFavorite: _isFavorite),
        AppRoutes.settings: (context) => SettingsScreen(
              settings: settings,
              onSettingsChange: _filterMeals,
            ),
      },
    );
  }
}
