// ignore: unused_import
import 'package:chat_app/chat_page.dart';
// ignore: unused_import
import 'package:chat_app/loginpage.dart';
import 'package:chat_app/start_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return MaterialApp(
      title: "Chat App!!!",
      theme: ThemeData(
          canvasColor: Colors.transparent,
          primarySwatch: Colors.blue,
          // ignore: prefer_const_constructors
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.blue, foregroundColor: Colors.black)),
      // ignore: prefer_const_constructors
      home: start_page(),
      debugShowCheckedModeBanner: false,
    );
  }
}
