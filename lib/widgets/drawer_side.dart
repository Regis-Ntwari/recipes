import 'package:flutter/material.dart';

import '../screens/filter_screen.dart';

class DrawerSide extends StatelessWidget {
  const DrawerSide({super.key});

  Widget buildListTile(String title, IconData icon, Function() tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 24),
      title: Text(title, style: const TextStyle(fontSize: 22)),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          color: Colors.deepOrange,
          height: 100,
          child: const Text(
            'Recipes',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        buildListTile('Meals', Icons.fork_left, () {
          Navigator.of(context).pushReplacementNamed("/");
        }),
        buildListTile('Filters', Icons.settings, () {
          Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
        })
      ],
    ));
  }
}
