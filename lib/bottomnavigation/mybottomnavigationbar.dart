import 'package:flutter/material.dart';
import 'package:shopify/screen/homepage.dart';

import '../screen/Favorites.dart';

class mybottomNavigation extends StatefulWidget {
  const mybottomNavigation({Key? key}) : super(key: key);

  @override
  State<mybottomNavigation> createState() => _mybottomNavigationState();
}

class _mybottomNavigationState extends State<mybottomNavigation> {
  int _selectedIndex = 0;
  final tabs = [
    homepage(),
    const Text('This is a 2 page'),
    const Text('This is a 3 page'),
    FavoritesItem(),
    const Text('This is a 5 page'),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  // Add Your Code here.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.purple,
        showSelectedLabels: false,
        backgroundColor: Colors.grey.shade300,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              backgroundColor: Colors.yellow,
              label: " "),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view),
              backgroundColor: Colors.grey,
              label: " "),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              backgroundColor: Colors.green,
              label: " "),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              backgroundColor: Colors.amber,
              label: " "),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              backgroundColor: Colors.lightBlueAccent,
              label: " "),
        ],

        onTap: _onItemTapped,
      ),
    );
  }
}
