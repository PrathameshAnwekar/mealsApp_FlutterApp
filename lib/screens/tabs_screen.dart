import 'package:flutter/material.dart';


import './categories_screen.dart';
import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import '../models/meals.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, dynamic>> _pages = [];

  int selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }
  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(widget.favoriteMeals), 'title': 'Favorites'}
    ];    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
      ),
      drawer: MainDrawer(),
      body: _pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: selectedPageIndex,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              label: '')
        ],
      ),
    );
  }
}
