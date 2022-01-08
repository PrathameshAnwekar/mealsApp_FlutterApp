enum Complexity { Simple, Challenging, Hard }
enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final String id;
  final List<String> categories;
  final Complexity complexity;
  final List<String> ingredients;
  final String imageUrl;
  final int duration;
  final List<String> steps;
  final String title;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  const Meal(
      {required this.id,
      required this.categories,
      required this.complexity,
      required this.ingredients,
      required this.imageUrl,
      required this.duration,
      required this.steps,
      required this.title,
      required this.affordability,
      required this.isGlutenFree,
      required this.isVegan,
      required this.isVegetarian,
      required this.isLactoseFree});
}
