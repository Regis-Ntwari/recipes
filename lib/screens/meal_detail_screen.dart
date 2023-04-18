import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class MealDetail extends StatelessWidget {
  static const routeName = 'meal-detail';

  final Function toggleFavorite;
  final Function isFavorite;

  const MealDetail(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext ctx, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(text, style: Theme.of(ctx).textTheme.titleMedium),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final title = arguments['title'];

    final selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id == arguments['id']);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(title!)),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: ((context, index) => Card(
                      color: const Color.fromRGBO(255, 254, 229, 1),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(selectedMeal.ingredients[index])),
                      ),
                    )),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
              itemBuilder: ((context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(child: Text('# ${(index + 1)}')),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      const Divider(),
                    ],
                  )),
              itemCount: selectedMeal.steps.length,
            ))
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => toggleFavorite(selectedMeal.id),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          child: isFavorite(selectedMeal.id)
              ? const Icon(Icons.star)
              : const Icon(Icons.star_border_outlined),
        ),
      ),
    );
  }
}
