import 'package:flutter/material.dart';
import 'package:flutter_meal/data/dummy_data.dart';
import 'package:flutter_meal/screen/meals.dart';
import 'package:flutter_meal/widgets/category_grid_item.dart';

import '../models/categorys.dart';
import '../models/meals.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    selectedCategory(BuildContext context, Categorys category) {
      final filteredCategory = widget.availableMeals
          .where((meals) => meals.categories.contains(category.id))
          .toList();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => MealsScreen(
            title: category.title,
            meals: filteredCategory,
          ),
        ),
      );
    }

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(CurvedAnimation(
                  parent: _animationController, curve: Curves.ease)),
          child: child,
        );
      },
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.5),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                selectedCategory(context, category);
              },
            )
        ],
      ),
    );
  }
}
