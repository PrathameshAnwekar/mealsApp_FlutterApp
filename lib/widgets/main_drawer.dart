import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String text, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        text,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).primaryColor,
          child: Text(
            'Cooking Up!',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).accentColor),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        buildListTile('Meals', Icons.restaurant, () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        buildListTile('Settings', Icons.settings, () {
          Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
        })
      ]),
    );
  }
}
