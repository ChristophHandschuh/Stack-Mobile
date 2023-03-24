import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:stack_flashcards/functions/fetch_cards.dart';

class stack_info extends StatelessWidget {
  final index;
  const stack_info({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storage = Hive.box('storage');
    late var stacks = storage.get(0);
    fetch_cards();

    return Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffc7c7c7)),
                    borderRadius: BorderRadius.circular(10)
                ),
                child:
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      child: Icon(Icons.history_edu, size: 35),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Practice", style: TextStyle(fontSize: 18, fontFamily: "Outfit_Bold")),
                          Text("Review Terms and defintions", style: TextStyle(color: Color(0xff909090))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffc7c7c7)),
                    borderRadius: BorderRadius.circular(10)
                ),
                child:
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      child: Icon(Icons.quiz, size: 35),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Test", style: TextStyle(fontSize: 18, fontFamily: "Outfit_Bold")),
                          Text("Test your knowledge with a Test", style: TextStyle(color: Color(0xff909090))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, top: 25),
                child: Text("Cards", style: TextStyle(fontSize: 25)),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: TextField(
                  onChanged: (value) => print(value),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    prefixIconConstraints: BoxConstraints(
                        minWidth: 23, maxHeight: 20),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Icon(Icons.search),
                    ),
                    prefixIconColor: Colors.grey,
                    isCollapsed: true,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: 'Search',
                  ),
                ),
              ),
              Text(storage.get(stacks[index]["cards"][0]["card_id"]).toString()),
              /*Expanded(
                child: foundStacks.isNotEmpty ? RefreshIndicator(
                  color: Colors.black,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(left: 12, right: 12, top: 15),
                    itemCount: foundStacks.length,
                    itemBuilder: (context, index) => stack_item(data: foundStacks[index], index: index),
                  ),
                  onRefresh: () async {
                    await fetch_stacks();
                    stacks = storage.get(0);
                    runFilter(search_text);
                  },
                ) : Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text("no Results")
                ),
              ),*/
            ],
          ),
        )
    );
  }
}
