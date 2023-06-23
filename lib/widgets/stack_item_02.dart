import 'dart:developer';
import 'package:stack_flashcards/stack_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stack_flashcards/functions/delete_stacks.dart' as ds;

class stack_item_02 extends StatelessWidget {
  final data;
  final index;
  final func;
  const stack_item_02({Key? key, required this.data, required this.index, required this.func}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double learned = 0;
    double learning = 0;
    double new_card = 0;
    var learned_count = 0;

    for(var i = 0; i<data["cards"].length; i++){
      if(data["cards"][i]["status"] == "new"){
        new_card++;
      }else if(data["cards"][i]["status"] == "learning"){
        learning++;
      }else if(data["cards"][i]["status"] == "learned"){
        learned++;
        learned_count++;
      }
    }
    var sum = new_card + learning + learned;
    new_card = 1 - (new_card/sum);
    learned = learned/sum;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
              offset: Offset(0, 2), // Shadow position
            ),
          ],
          border: Border.all(color: Color(0xffc7c7c7)),
          borderRadius: BorderRadius.circular(15)
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => stack_info(index: index),
            ),
          );
        },
        onLongPress: () {  showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Delete Satck'),
              content: Text('Once deleted it cannot be restored!'),
              actions: <Widget>[
                TextButton(
                  child: Text('CANCEL'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('Delete'),
                  onPressed: () {
                    ds.onDeleteStack(index, func);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );},
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10),
              height: 95,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 17, left: 10),
                      child: Text(data["name"], style: TextStyle(fontFamily: "Outfit_Bold", fontSize: 20))
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 5, left: 10),
                      width: screenWidth - 62,
                      child: Row(
                        children: [
                          Text(learned_count.toString() + "/" + data["cards"].length.toString(), style: TextStyle(fontSize: 12, color: Color(0xff909090))),
                          Spacer(),
                          Text("66%", style: TextStyle(fontSize: 12))
                        ],
                      )
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 3, left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xff6C63FF),
                            Color(0xff6C63FF),
                            Color(0xffDBDBDB),
                            Color(0xffDBDBDB),
                          ],
                          stops: [
                            0.0,
                            learned,
                            learned,
                            1
                          ]
                      ),
                    ),
                    height: 12,
                    width: screenWidth - 62,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
