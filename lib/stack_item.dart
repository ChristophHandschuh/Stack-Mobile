import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class stack_item extends StatelessWidget {
  const stack_item({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xffc7c7c7)),
          borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 8,
            decoration: BoxDecoration(
                color: Color(0xffF69393),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8))
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text("NW 1.Test", style: TextStyle(fontFamily: "Outfit_Bold", fontSize: 15))
                ),
                Container(
                    child: Text("26 Cards", style: TextStyle(fontSize: 12, color: Color(0xff909090)))
                ),
                Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      color: Colors.grey,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
