import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class card_empty extends StatelessWidget {
  const card_empty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.only(top: 20),
      height: MediaQuery.of(context).size.width*1.4,
      width: MediaQuery.of(context).size.width-60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xffc7c7c7)),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            offset: Offset(0, 2), // Shadow position
          ),
        ],
      ),
    );
  }
}
