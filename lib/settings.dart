import 'package:flutter/material.dart';

class settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
          children: <Widget>[
            Container(
              margin:  const EdgeInsets.only( left: 10),
              child: Text("Settings", style: TextStyle(fontSize: 35)),
            ),
          ]
      ),
    );
  }
}