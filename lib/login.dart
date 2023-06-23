import 'package:flutter/material.dart';
import 'package:stack_flashcards/functions/check_login.dart';
import 'package:stack_flashcards/functions/login_func.dart';
import 'package:stack_flashcards/home.dart';
import 'package:stack_flashcards/main_page.dart';
import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:stack_flashcards/welcome.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();
  final password = TextEditingController();
  var login_text = "Welcome back! Glad \nto see you again!";

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
                height: 240,
                child: Center(
                    child: Image.asset('assets/images/login.png', width: 350)
                )
            ),
            Container(
              margin: const EdgeInsets.only(top: 0, left: 20),
              child: Text(login_text, style: TextStyle(fontSize: 30)),
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
                  hintText: 'Enter your Email',
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
                margin: const EdgeInsets.only(left: 15, top: 30),
                child: InkWell(
                  onTap: () async {
                    var data = await login_func(email.text, password.text);
                    if(data["loggedIn"] == true){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => main_page(),
                        ),
                      );
                    }else{
                      setState(() {
                        login_text = "Login failed. Please try again.";
                      });
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: Icon(Icons.login),
                      ),
                      Text("Login", style: TextStyle(fontSize: 18)),
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
