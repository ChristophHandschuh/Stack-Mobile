import 'package:flutter/material.dart';

class explore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
          children: <Widget>[
            Container(
              margin:  const EdgeInsets.only( left: 10),
              child: Text("Explore", style: TextStyle(fontSize: 35)),
            ),
          ]
      ),
    );
  }
}