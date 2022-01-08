import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../models/meals.dart';
import '../widgets/meal_item.dart';

class CategoryItemScreen extends StatefulWidget {
  static const routeName = '/category-item-screen';
  final List<Meal> availableMeals;
  CategoryItemScreen(this.availableMeals);

  @override
  State<CategoryItemScreen> createState() => _CategoryItemScreenState();
}

class _CategoryItemScreenState extends State<CategoryItemScreen> {
  late List<Meal> displayedMeals;
  late String categoryTitle;
  bool _loadedInitData = false;
  @override
  void initState() {
    // ...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'] as String;
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            title: displayedMeals[index].title,
            duration: displayedMeals[index].duration,
            imageUrl: displayedMeals[index].imageUrl,
            removeItem: () {},
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
