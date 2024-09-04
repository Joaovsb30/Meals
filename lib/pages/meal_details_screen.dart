import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  final Function(Meal) onToggleFavorite;
  final bool Function(Meal) isFavorite;
  const MealDetailScreen({
    super.key,
    required this.onToggleFavorite,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    Widget createSectionTitle(BuildContext context, String title) {
      return SizedBox(
        child: Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
      );
    }

    Widget createSectionContainer(Widget child) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 8,
          left: 10,
          right: 10,
          bottom: 8,
        ),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.pink[50]),
            padding: const EdgeInsets.only(
              top: 10,
            ),
            height: 200,
            child: child),
      );
    }

    final meal = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          meal.title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            createSectionTitle(
              context,
              'Ingredientes',
            ),
            createSectionContainer(
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (context, index) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              child: Text((index + 1).toString()),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              meal.ingredients[index],
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.deepPurple[200],
                        )
                      ]);
                },
              ),
            ),
            createSectionTitle(context, 'Modo de preparo'),
            createSectionContainer(ListView.builder(
              itemCount: meal.steps.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: Text(
                            meal.steps[index],
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                  ],
                );
              },
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onToggleFavorite(meal);
        },
        child: isFavorite(meal)
            ? const Icon(Icons.star)
            : const Icon(Icons.star_border),
      ),
    );
  }
}
