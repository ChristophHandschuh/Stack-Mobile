import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class card_ui extends StatelessWidget {
  final data;
  const card_ui({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      //margin: const EdgeInsets.only(top: 20),
      height: screenWidth*1.4,
      width: screenWidth-60,
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
      child: Center(
        child: Text(data),
      ),
    );
  }
}
