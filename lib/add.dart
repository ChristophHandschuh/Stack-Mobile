import 'package:flutter/material.dart';

class add extends StatefulWidget {
  const add({Key? key}) : super(key: key);
  @override
  _add createState() => _add();
}

class _add extends State<add>  {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('options'),
        ),
        body: Container(
          child: Text("dark mode, programmierer, language"
              "sonstige improvements: search History, Kamera, button, share online()"),
        )
    );
  }
}