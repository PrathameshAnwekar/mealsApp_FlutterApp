import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  MealDetailScreen(this.toggleFavorite, this.isMealFavorite);
  Function toggleFavorite;
  Function isMealFavorite;
  static const routename = '/meal-details';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(text, style: Theme.of(context).textTheme.subtitle1));
  }

  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
        height: 150,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(15)),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
              width: double.infinity,
              height: 300,
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
                context,
                ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    margin: EdgeInsets.all(10),
                    color: Colors.black12,
                    child: Center(
                        child: Text(
                      selectedMeal.ingredients[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                )),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
                context,
                Container(
                    child: ListView.builder(
                  itemBuilder: (ctx, index) => ListTile(
                    leading: CircleAvatar(child: Text('${index + 1}')),
                    title: Text('${selectedMeal.steps[index]}'),
                  ),
                  itemCount: selectedMeal.steps.length,
                ))),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
            isMealFavorite(mealId) ? Icons.favorite : Icons.favorite_border),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
