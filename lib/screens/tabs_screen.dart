import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorites_screen.dart';

import '../models/Recipe.dart';
import '../widgets/drawer_side.dart';

class TabsScreen extends StatefulWidget {
  final List<Recipe> favoriteMeals;

  const TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Widget>> _screens;

  @override
  void initState() {
    // TODO: implement initState
    _screens = [
      {'page': const CategoriesScreen(), 'title': const Text('Categories')},
      {
        'page': FavoriteScreen(widget.favoriteMeals),
        'title': const Text('Favorites')
      }
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: _screens[_selectedPageIndex]['title'] as Widget),
        drawer: const DrawerSide(),
        body: _screens[_selectedPageIndex]['page'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.deepOrange,
            unselectedItemColor: Colors.black87,
            selectedItemColor: Colors.white,
            currentIndex: _selectedPageIndex,
            type: BottomNavigationBarType.shifting,
            onTap: _selectPage,
            items: const [
              BottomNavigationBarItem(
                  backgroundColor: Colors.deepOrange,
                  icon: Icon(Icons.category),
                  label: 'Categories'),
              BottomNavigationBarItem(
                  backgroundColor: Colors.deepOrange,
                  icon: Icon(Icons.star),
                  label: 'Favorites')
            ]),
      ),
    );
  }
}
