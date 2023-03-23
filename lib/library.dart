import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:stack_flashcards/stack_item.dart';

class library_page extends StatefulWidget {

  @override
  State<library_page> createState() => _library_pageState();
}

class _library_pageState extends State<library_page> {
  //final storage = Hive.box('storage');
  final List<Map<String, dynamic>> stacks = [
    {"_id":"6418b5cb5b24419611235fc5","userID":"63b70dd8c8999a7064f1e6ab","name":"stack","color":"#EE8989","cardsNew":0,"cardsLearning":0,"cardsLearned":0,"cards":[],"createdAt":"2023-03-20T19:36:43.316Z"},
    {"_id":"640da3c3da939706591dc610","userID":"63b70dd8c8999a7064f1e6ab","name":"test","color":"#EE8989","cardsNew":7,"cardsLearning":0,"cardsLearned":0,"cards":[{"card_id":"640f2b8eeee9ac96a8f955f8","status":"new","ease_factor":250,"step_index":0,"time":1678715790802,"interval":0}],"createdAt":"2023-03-12T10:04:51.907Z"}
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> foundStacks = [];

  @override initState() {
    foundStacks = stacks;
    super.initState();
  }

  // This function is called whenever the text field changes
  void runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = stacks;
    } else {
      print(stacks.where((user) => user["name"].toLowerCase().contains(enteredKeyword.toLowerCase())).toList());
      results = stacks.where((user) => user["name"].toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }

    // Refresh the UI
    setState(() {
      foundStacks = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(storage.get(0));
    return SafeArea(
      child: Column(
          children: <Widget>[
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 5),
                  child: Text("Library", style: TextStyle(fontSize: 30)),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 15),
              child: TextField(
                onChanged: (value) => runFilter(value),
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
            Expanded(
              child: foundStacks.isNotEmpty
                  ? ListView.builder(
                      padding: const EdgeInsets.only(left: 12, right: 12, top: 15),
                      itemCount: foundStacks.length,
                      itemBuilder: (context, index) => stack_item(data: foundStacks[index], index: index),
              ) : Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text("no Results")
              ),
            ),
          ]
      ),
    );
  }
}