import 'package:flutter/material.dart';

import '../widgets/drawer_side.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = '/filter';
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Filters')),
        drawer: const DrawerSide(),
        body: const Center(child: Text('Hello')),
      ),
    );
  }
}
