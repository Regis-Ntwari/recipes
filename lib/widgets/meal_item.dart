import 'package:flutter/material.dart';
import 'package:recipes/screens/meal_detail_screen.dart';
import '../models/Recipe.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;

  const MealItem(
      {super.key,
      required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordability,
      required this.removeItem});

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetail.routeName,
        arguments: {'id': id, 'title': title}).then((value) {
      if (value != null) {
        this.removeItem(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  bottom: 25,
                  right: 10,
                  child: Container(
                    width: 220,
                    padding: const EdgeInsets.all(10),
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                    ),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(Icons.punch_clock),
                    const SizedBox(width: 6),
                    Text('$duration min')
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.lock),
                    const SizedBox(width: 6),
                    Text(complexity.name)
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.money),
                    const SizedBox(width: 6),
                    Text(affordability.name)
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
