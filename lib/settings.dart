import 'package:flutter/material.dart';
import 'package:stack_flashcards/login.dart';

import 'functions/logout_func.dart';

class settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Column(
          children: <Widget>[
            Container(
                margin: const EdgeInsets.only(top: 20),
                child: Center(
                    child: Image.asset('assets/images/profile_men.png', width: 300)
                )
            ),
            Container(
                margin: const EdgeInsets.only(),
                child: Text("Christoph Handschuh", style: TextStyle(fontSize: 32))
            ),
            Container(
                width: screenWidth-40,
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      offset: Offset(0, 2), // Shadow position
                    ),
                  ],
                ),
                margin: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Icon(Icons.settings),
                    ),
                    Text("General Settings", style: TextStyle(fontSize: 18, color: Colors.grey.shade600)),
                  ],
                )
            ),
            Container(
                width: screenWidth-40,
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      offset: Offset(0, 2), // Shadow position
                    ),
                  ],
                ),
                margin: const EdgeInsets.only(top: 30),
                child: InkWell(
                  onTap: () async {
                    print("Logout");
                    var data = await logout_func();
                    if(data["loggedOut"] == true){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => Login(),
                        ),
                      );
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: Icon(Icons.logout),
                      ),
                      Text("Logout", style: TextStyle(fontSize: 18, color: Colors.grey.shade600)),
                    ],
                  ),
                )
            ),
          ]
      ),
    );
  }
}