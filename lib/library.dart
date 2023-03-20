import 'package:flutter/material.dart';
import 'package:stack_flashcards/stack_item.dart';

class library_page extends StatelessWidget {
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
              margin: const EdgeInsets.only(left:10, right:10, top:15),
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  prefixIconConstraints:BoxConstraints(minWidth: 23, maxHeight: 20),
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
              child: ListView(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 15),
                children: <Widget>[
                  stack_item(),
                  stack_item(),
                  stack_item(),
                ],
              ),
            ),
          ]
      ),
    );
  }
}