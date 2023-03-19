import 'package:flutter/material.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Container(
            margin:  const EdgeInsets.only(top: 40, left: 10),
            child: Text("Library", style: TextStyle(fontSize: 35)),
          ),
        ]
    );
  }
}