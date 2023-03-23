import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:stack_flashcards/library.dart';
import 'package:stack_flashcards/settings.dart';
import 'package:stack_flashcards/home.dart';
import 'package:stack_flashcards/add.dart';
import 'package:stack_flashcards/explore.dart';
import 'package:hive/hive.dart';

void main() async {
  //init Hive and open storage
  await Hive.initFlutter();
  var storage = await Hive.openBox('storage');
  storage.put(0, [{"_id":"6418b5cb5b24419611235fc5","userID":"63b70dd8c8999a7064f1e6ab","name":"stack 2<br>","color":"#EE8989","cardsNew":0,"cardsLearning":0,"cardsLearned":0,"cards":[],"createdAt":"2023-03-20T19:36:43.316Z"},{"_id":"640da3c3da939706591dc610","userID":"63b70dd8c8999a7064f1e6ab","name":"test","color":"#EE8989","cardsNew":7,"cardsLearning":0,"cardsLearned":0,"cards":[{"card_id":"640f2b8eeee9ac96a8f955f8","status":"new","ease_factor":250,"step_index":0,"time":1678715790802,"interval":0}],"createdAt":"2023-03-12T10:04:51.907Z"}]);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark
  ));
  runApp(MaterialApp(
      theme: ThemeData(fontFamily: 'Outfit'),
      debugShowCheckedModeBanner: false,
      home: Stack()
  ));
}

class Stack extends StatefulWidget {
  const Stack({Key? key}) : super(key: key);

  @override
  State<Stack> createState() => _StackState();
}

class _StackState extends State<Stack> {

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
