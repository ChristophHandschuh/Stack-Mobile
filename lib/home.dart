import 'package:flutter/material.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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