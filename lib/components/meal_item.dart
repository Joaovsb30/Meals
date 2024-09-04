import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/utils/app_routes.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({
    super.key,
    required this.meal,
  });

  void _selecteMeal(BuildContext context) => Navigator.of(context)
      .pushNamed(AppRoutes.mealDetails, arguments: meal)
      .then((value) {});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selecteMeal(context),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      meal.imageUrl,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Text(
                        meal.title,
                        style: Theme.of(context).textTheme.headlineSmall,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.schedule),
                        const SizedBox(
                          width: 6,
                        ),
                        Text('${meal.duration} min'),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.work),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(meal.complexityText),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.monetization_on_outlined),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(meal.costText)
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
