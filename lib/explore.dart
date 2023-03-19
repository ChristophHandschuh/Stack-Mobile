import 'package:flutter/material.dart';

class explore extends StatefulWidget {
  const explore({Key? key}) : super(key: key);
  @override
  _explore createState() => _explore();
}

class _explore extends State<explore>  {

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