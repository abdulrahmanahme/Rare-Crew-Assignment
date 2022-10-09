import 'package:flutter/material.dart';
import 'package:rare_crew/view/note_page.dart';
import 'package:rare_crew/view/profile_page.dart';

// final bottomBarProvider = StateProvider((ref) => 0);

class BottomBar {
  int pageNumber = 0;
  List<String> title = ['Home', 'Profile'];
  void bottomBarIndex(int index) {
    pageNumber = index;
  }

  List<Widget> screen = [
    NotesPage(),
    ProfileScreen(),
  ];

  List<BottomNavigationBarItem> itemsBottom = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
      backgroundColor: Colors.grey,
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
      backgroundColor: Colors.grey,
    ),
  ];
}
