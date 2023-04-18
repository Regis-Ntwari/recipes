import 'package:flutter/material.dart';

import '../widgets/drawer_side.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter';
  final Function setFilters;
  final Map<String, bool> filters;
  const FilterScreen(this.filters, this.setFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var gluttenFree = false;
  var lactoseFree = false;
  var isVegan = false;
  var isVegetarian = false;
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      gluttenFree = widget.filters['glutten']!;
      lactoseFree = widget.filters['lactose']!;
      isVegan = widget.filters['vegan']!;
      isVegetarian = widget.filters['vegetarian']!;
    });
    super.initState();
  }

  Widget _buildFilterTile(String title, String description, bool value,
      Function(bool) changeValue) {
    return SwitchListTile(
        title: Text(title),
        activeColor: Theme.of(context).colorScheme.secondary,
        subtitle: Text(description),
        value: value,
        onChanged: changeValue);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Filters'),
          actions: [
            IconButton(
                onPressed: () {
                  widget.setFilters({
                    'glutten': gluttenFree,
                    'lactose': lactoseFree,
                    'vegan': isVegan,
                    'vegetarian': isVegetarian
                  });
                },
                icon: const Icon(Icons.save))
          ],
        ),
        drawer: const DrawerSide(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Adjust your Filters',
                style: TextStyle(fontSize: 24, color: Colors.deepOrange),
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildFilterTile('Glutten Free',
                    'Only include glutten free meals', gluttenFree, (newValue) {
                  setState(() {
                    gluttenFree = newValue;
                  });
                }),
                _buildFilterTile('Lactose Free',
                    'Only include lactose free meals', lactoseFree, (newValue) {
                  setState(() {
                    lactoseFree = newValue;
                  });
                }),
                _buildFilterTile('Vegan', 'Only include Vegan meals', isVegan,
                    (newValue) {
                  setState(() {
                    isVegan = newValue;
                  });
                }),
                _buildFilterTile(
                    'Vegetarian', 'Only include vegetarian meals', isVegetarian,
                    (newValue) {
                  setState(() {
                    isVegetarian = newValue;
                  });
                })
              ],
            ))
          ],
        ),
      ),
    );
  }
}
