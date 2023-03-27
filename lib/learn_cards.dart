import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios_new, size: 23)
                    ),
                    Spacer(),
                    Container(
                        padding: const EdgeInsets.only(left: 15),
                        child: Icon(Icons.more_vert, size: 23)
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      )
    );
  }
}
