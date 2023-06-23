import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
            ],
          ),
        ),
    );
  }
}
