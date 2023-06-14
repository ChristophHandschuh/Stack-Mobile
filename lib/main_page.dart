import 'package:flutter/material.dart';
import 'package:stack_flashcards/library.dart';
import 'package:stack_flashcards/settings.dart';
import 'package:stack_flashcards/home.dart';
import 'package:stack_flashcards/add.dart';
import 'package:stack_flashcards/explore.dart';
import 'package:stack_flashcards/functions/fetch_stacks.dart';

class main_page extends StatefulWidget {
  const main_page({Key? key}) : super(key: key);

  @override
  State<main_page> createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {
  Future fetch = fetch_stacks();
  int index = 0;

  final pages = [
    home(),
    library_page(),
    add(),
    explore(),
    settings()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 23),
            activeIcon: Icon(Icons.home, size: 23),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_library_outlined, size: 23),
            activeIcon: Icon(Icons.local_library, size: 23),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_outlined, size: 23),
            activeIcon: Icon(Icons.add_circle_outlined, size: 23),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined, size: 23),
            activeIcon: Icon(Icons.explore, size: 23),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined, size: 23),
            activeIcon: Icon(Icons.settings, size: 23),
            label: 'Settings',
          ),
        ],
        currentIndex: index,
        selectedItemColor: Colors.grey[700],
        unselectedItemColor: Colors.grey[700],
        onTap: (index) => setState(() => this.index = index),
      ),
    );
  }
}
