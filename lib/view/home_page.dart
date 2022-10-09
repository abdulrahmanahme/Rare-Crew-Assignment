import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:rare_crew/view/note_page.dart';
import 'package:rare_crew/view/profile_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_crew/view_model/bottom_bar.dart';

final counterProvider = StateProvider<BottomBar>((ref) {
  return BottomBar();
});

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final number = ref.watch(counterProvider);

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey.shade900,
            title: Text(
              number.title[number.pageNumber],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: number.screen[number.pageNumber],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.blueGrey,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white70,
            elevation: 20.0,
            items: number.itemsBottom,
            currentIndex: number.pageNumber,
            onTap: (int index) {
              setState(() {
                number.bottomBarIndex(index);
              });
            },
          ),
        );
      },
    );
  }
}
