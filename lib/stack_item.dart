import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class stack_item extends StatelessWidget {
  final data;
  final index;
  const stack_item({Key? key, required this.data, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xffc7c7c7)),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          Container(
            height: 85,
            width: 8,
            decoration: BoxDecoration(
                color: Color(0xffF69393),
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
                    child: Text("26 Cards", style: TextStyle(fontSize: 12, color: Color(0xff909090)))
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
                        stops: [0.0, 0.4, 0.4, 0.55, 0.55, 1]
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
    );
  }
}
