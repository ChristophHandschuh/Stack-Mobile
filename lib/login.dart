import 'package:flutter/material.dart';
import 'package:stack_flashcards/functions/check_login.dart';
import 'package:stack_flashcards/functions/login_func.dart';
import 'package:stack_flashcards/home.dart';
import 'package:stack_flashcards/main_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final username = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40, bottom: 40),
                child: Text("Login", style: TextStyle(fontSize: 35))
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                controller: username,
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Username',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: ElevatedButton(
                child: Text("Submit"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                ),
                onPressed: () async {
                  var data = await login_func(username.text, password.text);
                   if(data["loggedIn"] == true){
                     Navigator.of(context).push(
                       MaterialPageRoute(
                         builder: (_) => main_page(),
                       ),
                     );
                   }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
