import 'package:flutter/material.dart';

bottomNavigation(_selectedIndex, _onItemTapped) {
  return BottomNavigationBar(
  showSelectedLabels: false,
  showUnselectedLabels: false,
  type: BottomNavigationBarType.fixed,
  items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.calendar_today_outlined),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.people_outline),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.logout, color: Colors.red),
      label: '',
    ),
  ],
  currentIndex: _selectedIndex,
  fixedColor: const Color(0xFF00588A),
  onTap: _onItemTapped,
);
}

