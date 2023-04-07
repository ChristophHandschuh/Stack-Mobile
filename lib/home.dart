import 'package:flutter/material.dart';
import 'package:stack_flashcards/functions/login_func.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //login_func('Christoph', 'Hallo');
    return SafeArea(
      child: Column(
          children: <Widget>[
            Container(
              margin:  const EdgeInsets.only( left: 10),
              child: Text("Home", style: TextStyle(fontSize: 35)),
            ),
          ]
      ),
    );
  }
}