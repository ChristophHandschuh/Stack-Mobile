import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:stack_flashcards/stack_item.dart';
import 'package:stack_flashcards/fetch_stacks.dart';

class library_page extends StatefulWidget {

  @override
  State<library_page> createState() => _library_pageState();
}

class _library_pageState extends State<library_page> {
  final storage = Hive.box('storage');
  //List<Map<String, dynamic>> stacks = [];
  late var stacks = storage.get(0);
  // This list holds the data for the list view
  //List<Map<String, dynamic>>
  var foundStacks = [];

  @override initState() {
    foundStacks = stacks;
    super.initState();
  }

  //this function is called whenever the text field changes
  void runFilter(String enteredKeyword) {
    var results = [];
    if (enteredKeyword.isEmpty) {
      results = stacks;
    } else {
      results = stacks.where((user) => user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()) ? true : false).toList();
    }

    // Refresh the UI
    setState(() {
      foundStacks = results;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                ? RefreshIndicator(
                  child: ListView.builder(
                      padding: const EdgeInsets.only(left: 12, right: 12, top: 15),
                      itemCount: foundStacks.length,
                      itemBuilder: (context, index) => stack_item(data: foundStacks[index], index: index),
                  ),
                  onRefresh: () async {
                    await fetch_stacks();
                    stacks = storage.get(0);
                  },
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