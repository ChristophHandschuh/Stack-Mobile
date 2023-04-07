import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stack_flashcards/widgets/card_empty.dart';
import 'package:stack_flashcards/widgets/card_swipe.dart';

class learn_cards extends StatefulWidget {
  const learn_cards({Key? key}) : super(key: key);

  @override
  State<learn_cards> createState() => _learn_cardsState();
}

class _learn_cardsState extends State<learn_cards>{
  List<String> cards = ["normal"];

  @override
  Widget build(BuildContext context) {
    Function onLeftSwipe = () {
      return (){
        setState(() {
          cards.removeAt(0);
          cards.add("left");
          print(cards);
        });
      };
    };

    Function onRightSwipe = () {
      return (){
        print("right");
        setState(() {
          cards.removeAt(0);
          //cards.add("right");
          print(cards);
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
                    Text("1/20", style: TextStyle(fontSize: 20)),
                    Icon(Icons.more_vert, size: 23),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: cards.length!=0 ? Stack(
                    children: <Widget>[
                      card_empty(),
                      //card_swipe(key: UniqueKey(), data: "HALLO", onLeftSwipe: onLeftSwipe(), onRightSwipe: onRightSwipe()),
                    ]..addAll(cards.map((String data){return card_swipe(key: UniqueKey(),data: data, onLeftSwipe: onLeftSwipe(), onRightSwipe: onRightSwipe());}).toList(),),
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
