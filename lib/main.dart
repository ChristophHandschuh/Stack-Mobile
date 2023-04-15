import 'dart:io';

import 'package:stack_flashcards/functions/check_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stack_flashcards/login.dart';
import 'package:stack_flashcards/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ByteData data = await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark
  ));
  runApp(MaterialApp(
      theme: ThemeData(fontFamily: 'Outfit'),
      debugShowCheckedModeBanner: false,
      home: Stack_App()
  ));
}

class Stack_App extends StatefulWidget {
  const Stack_App({Key? key}) : super(key: key);

  @override
  State<Stack_App> createState() => _StackState();
}

class _StackState extends State<Stack_App> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: check_login(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data == true) {
              return main_page();
            } else if(snapshot.hasData && snapshot.data == false){
              print("LOGIN");
              return Login();
            }else{
              return Scaffold(
                body: Center(
                  child: Text("Error"),
                ),
              );
            }
          }else{
            return Scaffold();
          }
        }
    );
  }
}