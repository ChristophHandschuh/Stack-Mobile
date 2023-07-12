import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive/hive.dart';
import 'package:stack_flashcards/stack_info.dart';
import 'package:stack_flashcards/widgets/stack_item.dart';
import 'package:hive_flutter/adapters.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final storage = Hive.box('storage');
  late var stacks = storage.get(0);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    //Calculate the percentage finished cards
    var sum = stacks[0]["cards"].length;
    var learned = 0;
    for(var i = 0; i<sum; i++){
      if(stacks[0]["cards"][i]["status"] == "learned"){
        learned++;
      }
    }
    var percent_learned = ((learned/stacks[0]["cards"].length)*100).round();

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 17),
                      child: Text("Hello, Christoph", style: TextStyle(fontSize: 30)),
                    ),
                    Container(
                        margin: const EdgeInsets.only(right: 17),
                        height: 50,
                        child: Center(
                            child: Image.asset('assets/images/profile_men.png', width: 50)
                        )
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 12, left: 12, top: 20),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => stack_info(index: 0),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(22), topRight: Radius.circular(22), bottomRight: Radius.circular(26)),
                          color: Color(0xff6C63FF),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 25),
                              child: Text("Latest Stack", style: TextStyle(fontSize: 16, fontFamily: "Outfit", color: Colors.white)),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 20),
                              child: Icon(Icons.school, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 60,
                        color: Color(0xff6C63FF),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 28),
                              child: Text(stacks[0]["name"], style: TextStyle(fontSize: 35, fontFamily: "Outfit", color: Colors.white))
                            ),
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(100), bottomLeft: Radius.circular(100)),
                                color: Color(0xffFFFFFF),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 52,
                                    width: 52,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(100)),
                                      color: Color(0xff000000),
                                    ),
                                    child: Center(
                                      child: Icon(Icons.arrow_forward_ios_outlined, color: Colors.white, size: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ),
                      Container(
                        height: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(22), bottomRight: Radius.circular(22), topRight: Radius.circular(26)),
                          color: Color(0xff6C63FF),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 40, left: 25),
                              child: Row(
                                children: [
                                  Container(
                                    height: 12,
                                    width: ((screenWidth - 70)*(percent_learned/100)),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xffFFFFFF),
                                    ),
                                  ),
                                  Container(
                                    height: 12,
                                    width: ((screenWidth - 70)*(1-(percent_learned/100))),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xff6C63FF),
                                      border: Border.all(color: Color(0xffFFFFFF), width: 1.5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 25, bottom: 20),
                                    child: Text(stacks[0]["cards"].length.toString() + " Cards", style: TextStyle(fontSize: 14, fontFamily: "Outfit", color: Colors.white)),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 25, bottom: 20),
                                    child: Text("30 min", style: TextStyle(fontSize: 14, fontFamily: "Outfit", color: Colors.white)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 35, left: 17),
                alignment: Alignment.topLeft,
                child: Text("Others", style: TextStyle(fontSize: 20, fontFamily: "Outfit", color: Color(0xff000000)))
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 12, right: 12),
                child: Column(
                  children: [
                        for(var index = 1; index<stacks.length; index++)...[
                            stack_item(data: stacks[index], index: index),
                        ],
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
