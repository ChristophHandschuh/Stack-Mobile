import 'package:flutter/material.dart';

class add extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
          children: <Widget>[
            Container(
              margin:  const EdgeInsets.only( left: 10),
              child: Text("Add", style: TextStyle(fontSize: 35)),
            ),
          ]
      ),
    );
  }
}