import 'package:flutter/material.dart';
import './data/dummy_data.dart';

import './screens/filter_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'glutten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  var availableMeals = DUMMY_MEALS;

  void setFilters(Map<String, bool> newFilters) {
    setState(() {
      filters = newFilters;

      availableMeals = DUMMY_MEALS.where((meal) {
        if (filters['glutten']! && !meal.isGlutenFree) {
          return false;
        }
        if (filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'Raleway',
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange)
              .copyWith(secondary: Colors.yellow),
          textTheme: ThemeData.light().textTheme.copyWith(
              bodySmall: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              titleMedium: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
      initialRoute: '/',
      home: const TabsScreen(),
      routes: {
        CategoryMeals.routeName: (context) => CategoryMeals(availableMeals),
        MealDetail.routeName: (context) => const MealDetail(),
        FilterScreen.routeName: (context) => FilterScreen(filters, setFilters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => const TabsScreen(),
        );
      },
    );
  }
}
