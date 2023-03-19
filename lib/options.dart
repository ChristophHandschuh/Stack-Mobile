import 'dart:io';
import 'package:flutter/material.dart';

class options extends StatefulWidget {
  const options({Key? key}) : super(key: key);
  @override
  _options createState() => _options();
}


class _options extends State<options> {

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

