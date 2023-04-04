import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorites_screen.dart';

import '../widgets/drawer_side.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Widget>> _screens = [
    {'page': CategoriesScreen(), 'title': Text('Categories')},
    {'page': FavoriteScreen(), 'title': Text('Favorites')}
  ];

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
