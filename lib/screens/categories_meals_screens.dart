import 'package:flutter/material.dart';
import '../models/category.dart';
import '../componentes/meal_item.dart';
import '../models/meal.dart';

class CategoriesMealsScreens extends StatelessWidget {
  final List<Meal> meals;

  const CategoriesMealsScreens(this.meals);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          return MealItem(meal: categoryMeals[index]);
        },
      ),
    );
  }
}
