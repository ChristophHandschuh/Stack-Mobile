import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stack_flashcards/widgets/card_empty.dart';
import 'package:stack_flashcards/widgets/card_swipe.dart';
import 'package:hive/hive.dart';

import 'functions/learn_Algo.dart';
//import 'functions/learn_Algo.dart';

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
      return () async {
        var card_now = await learn_Algo(false, cards);
        print(card_now.isNotEmpty);
        stacks[widget.index]["cards"] = cards;
        storage.put(0, stacks);
        setState(() {
          cards_stack.removeAt(0);
          if(card_now.isNotEmpty)
            cards_stack.add(card_now);
        });
      };
    };

    Function onRightSwipe = () {
      return () async{
        var card_now = await learn_Algo(true, cards);
        stacks[widget.index]["cards"] = cards;
        storage.put(0, stacks);
        setState(() {
          cards_stack.removeAt(0);
          if(card_now.isNotEmpty)
            cards_stack.add(card_now);
        });
      };
    };

    double learned = 0;
    double learning = 0;
    double new_card = 0;

    for(var i = 0; i<cards.length; i++){
      if(cards[i]["status"] == "new"){
        new_card++;
      }else if(cards[i]["status"] == "learning"){
        learning++;
      }else if(cards[i]["status"] == "learned"){
        learned++;
      }
    }
    var sum = new_card + learning + learned;
    new_card = 1 - (new_card/sum);
    learned = learned/sum;

    return (
      Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
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
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xff93F6AF),
                        Color(0xff93F6AF),
                        Color(0xffEFF693),
                        Color(0xffEFF693),
                        Color(0xffF69393),
                        Color(0xffF69393),
                      ],
                      stops: [
                        0.0,
                        learned,
                        learned,
                        new_card,
                        new_card,
                        1
                      ]
                  ),
                ),
                height: 3,
                width: MediaQuery.of(context).size.width,
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
