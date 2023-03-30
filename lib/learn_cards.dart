import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stack_flashcards/widgets/card_swipe.dart';

class learn_cards extends StatefulWidget {
  const learn_cards({Key? key}) : super(key: key);

  @override
  State<learn_cards> createState() => _learn_cardsState();
}

class _learn_cardsState extends State<learn_cards>{
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
                  child: Stack(
                    children: <Widget>[
                      Container(
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
                      ),
                      card_swipe(data: "HALLO"),
                    ],
                  ),
                )
              ),
            ],
          ),
        ),
      )
    );
  }
}
