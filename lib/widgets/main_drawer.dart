import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});
  final Function(String identifier) onSelectScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ), // LinearGradient
            ), // BoxDecoration
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                ),
                Text(
                  "Cooking Up",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant),
            title: Text(
              "Meals",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            onTap: () {
              onSelectScreen("meals");
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              "Filtered",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            onTap: () {
              onSelectScreen("filters");
            },
          ),
        ],
      ),
    );
  }
}
