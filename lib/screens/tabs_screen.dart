import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';
import '../componentes/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selecteScreenIndex = 0;

  List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens = [
      CategoriesScreen(),
      FavoriteScreen(widget.favoriteMeals),
    ];
  }

  final List<String> _titles = [
    "Lista de Categorias",
    "Meus Favoritos",
  ];

  _selectScreen(int index) {
    setState(() {
      _selecteScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selecteScreenIndex]),
      ),
      drawer: MainDrawer(),
      body: _screens[_selecteScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selecteScreenIndex,
        type: BottomNavigationBarType.shifting,
        onTap: _selectScreen,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(Icons.category),
            label: "Categorias",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favoritos",
          ),
        ],
      ),
    );
  }
}
