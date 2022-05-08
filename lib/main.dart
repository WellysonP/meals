import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Definição de propriedades globais de Theme
    final ThemeData theme = ThemeData(
      canvasColor: Color.fromRGBO(255, 254, 229, 1),
      fontFamily: 'Raleway',
    );
    return MaterialApp(
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
      home: CategoriesScreen(),
    );
  }
}
