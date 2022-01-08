import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {

  static const routeName = 'categories-screen';

  CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
          padding: EdgeInsets.all(25),
          children: dummyCategories.map((catData) {
            return CategoryItem(id: catData.id, title: catData.title, color: catData.color);
          }).toList(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 3 / 2),
        );
  }
}
