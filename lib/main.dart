import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';
import './screens/categories_meals_screens.dart';
import 'utils/app_routes.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import 'screens/settings_screen.dart';
import 'models/meal.dart';
import 'data/dummy_data.dart';
import 'models/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availabelMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _availabelMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    //Definição de propriedades globais de Theme
    final ThemeData theme = ThemeData(
      canvasColor: Color.fromRGBO(255, 254, 229, 1),
      fontFamily: 'Raleway',
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      //Definições pontuais mais utilizadas de Theme
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.pink,
          secondary: Colors.amberAccent,
        ),
        textTheme: theme.textTheme.copyWith(
          headline6: TextStyle(
            fontFamily: 'RobotoCondensed',
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      routes: {
        AppRoutes.HOME: (ctx) =>
            TabsScreen(_favoriteMeals), //Substituindo o home:
        AppRoutes.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScreens(_availabelMeals),
        AppRoutes.MEAL_DETAIL: (ctx) =>
            MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(settings, _filterMeals),
      },
    );
  }
}
