import 'package:flutter/material.dart';
import 'package:flutter_meal/screen/meal_details.dart';
import 'package:flutter_meal/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meals.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
  });
  final Meal meal;
  String get complexityText =>
      meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  String get affordabilityText =>
      meal.affordability.name[0].toUpperCase() +
      meal.affordability.name.substring(1);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => MealDetails(
                meal: meal,
              ),
            ),
          );
        },
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor.withOpacity(.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: const EdgeInsets.all(8),
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MealItemTrait(
                            icon: Icons.schedule,
                            label: "${meal.duration} min"),
                        MealItemTrait(icon: Icons.work, label: complexityText),
                        MealItemTrait(
                            icon: Icons.attach_money, label: affordabilityText),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
