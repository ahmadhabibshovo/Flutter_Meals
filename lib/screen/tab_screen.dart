import 'package:flutter/material.dart';
import 'package:flutter_meal/providers/favorites_provider.dart';
import 'package:flutter_meal/providers/filter_provider.dart';
import 'package:flutter_meal/screen/category.dart';
import 'package:flutter_meal/screen/filters_screen.dart';
import 'package:flutter_meal/screen/meals.dart';
import 'package:flutter_meal/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(availableMealProvider);

    void _setScreen(String identifier) async {
      if (identifier == 'filters') {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => FiltersScreen()));
      } else {
        Navigator.of(context).pop();
      }
    }

    final favoriteMeals = ref.watch(favoriteMealsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedIndex == 0 ? "Pick Category" : "Your Favorite "),
      ),
      body: _selectedIndex == 0
          ? CategoryScreen(
              availableMeals: availableMeals,
            )
          : MealsScreen(
              meals: favoriteMeals,
            ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Set Meal",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorite",
          )
        ],
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
    );
  }
}
