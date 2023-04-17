import 'package:flutter/material.dart';

import '../models/Recipe.dart';
import '../widgets/meal_item.dart';
import '../data/dummy_data.dart';

class CategoryMeals extends StatefulWidget {
  static const routeName = '/category-meals';

  const CategoryMeals();

  @override
  State<CategoryMeals> createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  late String title;
  late List<Recipe> categoryMeals;
  var didLoadItems = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!didLoadItems) {
      final routeArguments =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;

      title = routeArguments['title']!;
      final categoryId = routeArguments['id'];
      categoryMeals = DUMMY_MEALS.where((recipe) {
        return recipe.categories.contains(categoryId);
      }).toList();
      didLoadItems = true;
    }
  }

  void _removeItem(String mealId) {
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text(
          title,
        )),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: categoryMeals[index].id,
                title: categoryMeals[index].title,
                imageUrl: categoryMeals[index].imageUrl,
                duration: categoryMeals[index].duration,
                complexity: categoryMeals[index].complexity,
                affordability: categoryMeals[index].affordability,
                removeItem: _removeItem);
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
