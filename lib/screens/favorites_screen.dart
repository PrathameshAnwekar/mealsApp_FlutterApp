import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favoritedMeals;
  const FavoritesScreen(this.favoritedMeals);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favoritedMeals.isEmpty) {
      return const Center(
        child: Text('You don\'t have any favorites - yet!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: widget.favoritedMeals[index].id,
            affordability: widget.favoritedMeals[index].affordability,
            complexity: widget.favoritedMeals[index].complexity,
            title: widget.favoritedMeals[index].title,
            duration: widget.favoritedMeals[index].duration,
            imageUrl: widget.favoritedMeals[index].imageUrl,
            removeItem: () {},
          );
        },
        itemCount: widget.favoritedMeals.length,
      );
    }
  }
}
