import 'dart:developer';
import 'package:stack_flashcards/stack_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class stack_item extends StatelessWidget {
  final data;
  final index;
  const stack_item({Key? key, required this.data, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double learned = 0;
    double learning = 0;
    double new_card = 0;

    for(var i = 0; i<data["cards"].length; i++){
      print("DATA");
      print(data["cards"][i]);
      if(data["cards"][i]["status"] == "new"){
        new_card++;
      }else if(data["cards"][i]["status"] == "learning"){
        learning++;
      }else if(data["cards"][i]["status"] == "learned"){
        learned++;
      }
    }
    var sum = new_card + learning + learned;
    new_card = 1 - (new_card/sum);
    learned = learned/sum;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xffc7c7c7)),
          borderRadius: BorderRadius.circular(10)
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => stack_info(index: index),
            ),
          );
        },
        child: Row(
          children: [
            Container(
              height: 85,
              width: 8,
              decoration: BoxDecoration(
                  color: Color(int.parse(data["color"].replaceAll('#', '0xff'))),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              height: 85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: Text(data["name"], style: TextStyle(fontFamily: "Outfit_Bold", fontSize: 14))
                  ),
                  Container(
                      child: Text(data["cards"].length.toString() + " Cards", style: TextStyle(fontSize: 12, color: Color(0xff909090)))
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 17),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
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
                          stops: [0.0, learned, learned, new_card, new_card, 1]
                      ),
                    ),
                    height: 10,
                    width: screenWidth-62,
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
