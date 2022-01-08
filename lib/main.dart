import 'package:flutter/material.dart';

import './dummy_data.dart';
import './screens/tabs_screen.dart';
import './screens/category_item_screen.dart';
import './screens/meal_detail_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/filters_screen.dart';
import './models/meals.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'vegan': false,
    'vegetarian': false,
    'lactoseFree': false,
    'glutenFree': false,
  };

  List<Meal> availableMeals = dummyMeals;
  List<Meal> favoriteMeals = [];
  bool isMealFavorite(String mealId){
    return favoriteMeals.any((meal) => meal.id == mealId);
  }

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;

      availableMeals = dummyMeals.where((meal) {
        if (filters['vegan'] == true && !meal.isVegan) return false;
        if (filters['vegetarian'] == true && !meal.isVegetarian) return false;
        if (filters['lactoseFree'] == true && !meal.isLactoseFree) return false;
        if (filters['glutenFree'] == true && !meal.isGlutenFree) return false;
        return true;
      }).toList();
    });
  }

  void toggleFavorite(mealId) {
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteMeals.add(dummyMeals.firstWhere((meal) => mealId == meal.id));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
          accentColor: Colors.amber,
          primarySwatch: Colors.red,
          canvasColor: const Color.fromRGBO(255, 254, 249, 0.1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              subtitle1: const TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoCondensed'))),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(favoriteMeals),
        CategoriesScreen.routeName: (context) => CategoriesScreen(),
        CategoryItemScreen.routeName: (context) => CategoryItemScreen(availableMeals),
        MealDetailScreen.routename: (context) => MealDetailScreen(toggleFavorite, isMealFavorite),
        FiltersScreen.routeName: (context) => FiltersScreen(filters, setFilters)
      },
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
    );
  }
}
