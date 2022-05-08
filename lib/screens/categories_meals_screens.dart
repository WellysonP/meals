import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoriesMealsScreens extends StatelessWidget {
  // final Category category;

  // const CategoriesMealsScreens(this.category);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: Text(
          "Receitas por categorias ${category.id}",
        ),
      ),
    );
  }
}
