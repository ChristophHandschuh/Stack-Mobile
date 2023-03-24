import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class stack_info extends StatelessWidget {
  final index;
  const stack_info({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storage = Hive.box('storage');
    late var stacks = storage.get(0);

    return Scaffold(
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
                    Icon(Icons.share, size: 23),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: Icon(Icons.more_vert, size: 23)
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Row(
                  children: [
                    Container(
                      height: 55,
                      width: 12,
                      color: Color(int.parse(stacks[index]["color"].replaceAll('#', '0xff'))),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(stacks[index]["name"], style: TextStyle(fontSize: 20, fontFamily: "Outfit_Bold")),
                          Text(stacks[index]["cards"].length.toString() + " Cards", style: TextStyle(color: Color(0xff909090))),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
