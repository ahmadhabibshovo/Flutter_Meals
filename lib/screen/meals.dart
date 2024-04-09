import 'package:flutter/material.dart';
import 'package:flutter_meal/widgets/meal_item.dart';

import '../models/meals.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });
  final String? title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title.toString() != "null"
          ? AppBar(
              title: Text(
                title!,
              ),
            )
          : null,
      body: meals.isEmpty
          ? Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Uh oh ... nothing here!",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 30),
                  ),
                  Text(
                    "Try selecting different category",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 30),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: meals.length,
              itemBuilder: (ctx, index) => MealItem(
                    meal: meals[index],
                  )),
    );
  }
}
