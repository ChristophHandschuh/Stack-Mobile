import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stack_flashcards/widgets/card_empty.dart';
import 'package:stack_flashcards/widgets/card_swipe.dart';
import 'package:hive/hive.dart';
import 'functions/learn_Algo.dart';

class learn_cards extends StatefulWidget {
  final index;
  const learn_cards({Key? key, required this.index}) : super(key: key);

  @override
  State<learn_cards> createState() => _learn_cardsState();
}

class _learn_cardsState extends State<learn_cards>{
  final storage = Hive.box('storage');
  late var stacks = storage.get(0);
  List<Map<String,dynamic>> cards_stack = [];
  var cards = [];

  void initState() {
    cards = stacks[widget.index]["cards"];
    print(stacks[widget.index]["cards"]);
    if(DateTime.now().add(Duration(minutes: 1)).millisecondsSinceEpoch > cards[0]["time"]){
      cards_stack.add(storage.get(cards[0]["card_id"]));
    }
  }

  @override
  Widget build(BuildContext context) {
    Function onLeftSwipe = () {
      return () {
        var card_now = learn_Algo(false, cards);
        stacks[widget.index]["cards"] = cards;
        storage.put(0, stacks);
        print(stacks[widget.index]["cards"]);
        setState(() {
          cards_stack.removeAt(0);
          //cards_stack.add(card_now);
        });
      };
    };

    Function onRightSwipe = () {
      return () {
        /*var card_now = learn_Algo(true, cards);
        stacks[widget.index]["cards"] = cards;
        storage.put(0, stacks);
        print(stacks[widget.index]["cards"]);*/
        setState(() {
          cards_stack.removeAt(0);
          //cards.add(card_now);
        });
      };
    };

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
                    Text(cards.where((i) => i["status"] == "learned").length.toString()+"/"+cards.length.toString(), style: TextStyle(fontSize: 20)),
                    Icon(Icons.more_vert, size: 23),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: cards_stack.isNotEmpty ? Stack(
                    children: <Widget>[
                      card_empty(),
                      //card_swipe(key: UniqueKey(), data: "HALLO", onLeftSwipe: onLeftSwipe(), onRightSwipe: onRightSwipe()),
                    ]..addAll(cards_stack.map((Map<String,dynamic> data){return card_swipe(key: UniqueKey(),data: data, onLeftSwipe: onLeftSwipe(), onRightSwipe: onRightSwipe());}).toList()),
                  ) : Text("Nothing left to learn!", style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
