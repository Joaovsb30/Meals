import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({
    super.key,
    required this.category,
  });

  // Método de navegação push()
  // void _selectedCategory(BuildContext context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (_) => CategoriesMealsScreen(
  //         category: category,
  //       ),
  //     ),
  //   );
  // }

  void _selectedCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.categoriesMeals,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(15),
      onTap: () => _selectedCategory(context),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              colors: [category.color.withOpacity(0.5), category.color],
              begin: Alignment.bottomLeft,
              end: Alignment.centerRight),
        ),
        child: Center(
          child: Text(
            category.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
