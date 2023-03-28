import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'widgets/card_ui.dart';

class learn_cards extends StatefulWidget {
  const learn_cards({Key? key}) : super(key: key);

  @override
  State<learn_cards> createState() => _learn_cardsState();
}

class _learn_cardsState extends State<learn_cards> {
  @override
  Widget build(BuildContext context) {

    return (
      Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios_new, size: 23)
                    ),
                    Text("1/20", style: TextStyle(fontSize: 20)),
                    Icon(Icons.more_vert, size: 23),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                    child: Draggable(
                      child: card_ui(data: "cards1"),
                      feedback: card_ui(data: "cards2"),
                      //check for left or right swipe
                      onDragEnd: (drag) {
                        if (drag.offset.dx > 0) {
                          print("right");
                        } else {
                          print("left");
                        }
                      },
                    ),
                  ),
                ),
              //),
            ],
          ),
        ),
      )
    );
  }
}
