import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String title;
  final String id;
  final Color color;

  const Category(
      {required this.title, required this.id, this.color = Colors.orange});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
