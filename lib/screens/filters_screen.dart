import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  FiltersScreen(this.currentFilters,this.saveFilters);

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  static const routeName = 'filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;
  bool _glutenFree = false;

  @override
  void initState() {
    _vegan = widget.currentFilters['vegan'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;
    _lactoseFree = widget.currentFilters['lactoseFree'] as bool;
    _glutenFree = widget.currentFilters['glutenFree'] as bool;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildFilter(
        String title, String subtitle, bool currentvalue, Function(bool) setValue) {
      return SwitchListTile(
        value: currentvalue,
        title: Text(title),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.grey),
        ),
        onChanged: setValue,
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Filters'),
          actions: [
            IconButton(
                icon: const Icon(Icons.save),
                onPressed: () {
                  final selectedFilters = {
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                    'lactoseFree': _lactoseFree,
                    'glutenFree': _glutenFree,
                  };
                  widget.saveFilters(selectedFilters);
                }),
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: BorderRadius.circular(20)),
              child: Text('Adjust your meal selection.',
                  style: Theme.of(context).textTheme.subtitle1),
            ),
            Expanded(
                child: ListView(
              children: [
                buildFilter(
                    'Vegetarian', 'Only include vegetarian meals', _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                buildFilter('Gluten Free', 'Only include gluten free meals',
                    _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                buildFilter('Lactose Free', 'Only include lactose free meals',
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                buildFilter('Vegan', 'Only include vegan meals', _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
