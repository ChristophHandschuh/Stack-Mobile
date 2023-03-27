import 'package:flutter/material.dart';

class card_item extends StatelessWidget {
  final data;
  const card_item({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return (
        Container(
          margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xffc7c7c7)),
              borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: Text(data["front"], style: TextStyle(fontSize: 15, fontFamily: "Outfit")),
              ),
              Container(
                height: 2,
                color: Color(0xffC6C6C6),
                width: screenWidth - 100,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: Text(data["back"], style: TextStyle(fontSize: 15, fontFamily: "Outfit")),
              )
            ],
          ),
        )
    );
  }
}