import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:stack_flashcards/library.dart';
import 'package:stack_flashcards/settings.dart';
import 'package:stack_flashcards/home.dart';
import 'package:stack_flashcards/add.dart';
import 'package:stack_flashcards/explore.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

void main() async {
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
  Future usersFuture = fetchUsers();

  //http download from server and save
  static Future fetchUsers() async {
    try{
    const url = 'http://my-json-server.typicode.com/ChristophHandschuh/Stack-Mobile/stacks';
    final response = await http.get(Uri.parse(url));
    final body = json.decode(response.body);
    log("json: $body");

    //init Hive and open storage
    await Hive.initFlutter();
    var storage = await Hive.openBox('storage');
    storage.put(0, body['results']);
    } catch(e) {
      log("No internet: json couldn't load");
    }
  }

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
