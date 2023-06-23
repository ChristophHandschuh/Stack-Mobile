import 'package:flutter/material.dart';
import 'package:stack_flashcards/functions/check_login.dart';
import 'package:stack_flashcards/functions/login_func.dart';
import 'package:stack_flashcards/home.dart';
import 'package:stack_flashcards/login.dart';
import 'package:stack_flashcards/main_page.dart';
import 'package:stack_flashcards/signup.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final username = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10, left: 20),
                            child: Image.asset('assets/images/icon.png', width: 38, height: 35),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10, left: 10),
                            child: Text("STACK", style: TextStyle(fontSize: 24)),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 16, right: 20),
                        child: Text("English (AU)", style: TextStyle(fontSize: 16)),
                      ),
                    ]
                ),*/
                Container(
                    height: 400,
                    child: Center(
                        child: Image.asset('assets/images/study.png', width: 350)
                    )
                ),
                Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Text("Welcome to Stack!", style: TextStyle(fontSize: 32))
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
                    margin: const EdgeInsets.only(left: 20, top: 30),
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => SignUp(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: Icon(Icons.person),
                          ),
                          Text("Sign Up with Email", style: TextStyle(fontSize: 18, color: Colors.grey.shade600)),
                        ],
                      ),
                    )
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20, top: 25),
                      width: 125,
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: Text("or", style: TextStyle(fontSize: 16, color: Colors.grey.shade400))
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20, top: 25),
                      width: 125,
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                  ],
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
                    margin: const EdgeInsets.only(left: 20, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: Image.asset('assets/images/google.png', width: 20),
                        ),
                        Text("Continue with Google", style: TextStyle(fontSize: 18, color: Colors.grey.shade600)),
                      ],
                    )
                ),
                Container(
                    margin: const EdgeInsets.only(left: 20, top: 12),
                    child: InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => Login(),
                          ),
                        );
                      },
                      child: Text.rich(
                        TextSpan(
                          text: 'Already registered?  ',
                          style: TextStyle(fontSize: 16),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Log In',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                )),
                            // can add more TextSpans here...
                          ],
                        ),
                      ),
                    )
                )
              ]
          ),
        ),
    );
  }
}
