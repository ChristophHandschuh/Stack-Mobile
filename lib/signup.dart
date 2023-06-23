import 'package:flutter/material.dart';
import 'package:stack_flashcards/functions/check_login.dart';
import 'package:stack_flashcards/functions/login_func.dart';
import 'package:stack_flashcards/home.dart';
import 'package:stack_flashcards/main_page.dart';
import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:stack_flashcards/welcome.dart';

import 'functions/signup_func.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final password_conf = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset : false,
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: ExpandTapWidget(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => Welcome(),
                              ),
                            );
                          },
                          tapPadding: EdgeInsets.all(10),
                          child: Icon(Icons.arrow_back_ios_new, size: 23),
                        ),
                      ),
                    ]
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40, left: 20),
                child: Text("Hello! Register to get\nstarted", style: TextStyle(fontSize: 30)),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 30),
                child: TextField(
                  obscureText: false,
                  enableSuggestions: false,
                  autocorrect: false,
                  controller: username,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    hintText: 'Username',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: TextField(
                  obscureText: false,
                  enableSuggestions: false,
                  autocorrect: false,
                  controller: email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    hintText: 'Email',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: TextField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  controller: password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: TextField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  controller: password_conf,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    hintText: 'Confirm Password',
                  ),
                ),
              ),
              Container(
                width: screenWidth-30,
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
                margin: const EdgeInsets.only(left: 15, top: 50),
                child: InkWell(
                  onTap: () async {
                    print("SignUp");
                    if(password.text == password_conf.text){
                      var data = await signup_func(username.text, email.text, password.text);
                      print(data);
                      if(data["loggedIn"] == true){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => main_page(),
                          ),
                        );
                      }
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: Icon(Icons.login),
                      ),
                      Text("SignUp", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}
