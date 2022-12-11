import 'dart:async';

import 'package:chat_app/loginpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class start_page extends StatefulWidget {
  @override
  State<start_page> createState() => _start_pageState();
}

class _start_pageState extends State<start_page> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 9), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      // color: Colors.blue,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.pink, Colors.lightBlue],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [0.4, 0.7],
          tileMode: TileMode.repeated,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                RotateAnimatedText('Welcome',
                    textStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                      height: 2,
                      fontSize: 45,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    )),
                RotateAnimatedText('Chat App',
                    textStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                      height: 2,
                      fontSize: 45,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    )),
                RotateAnimatedText('Get ready',
                    textStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                      height: 2,
                      fontSize: 45,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Icon(
              Icons.message,
              color: Colors.white,
              size: 40,
            )
          ],
        ),
      ),
    ));
  }
}
