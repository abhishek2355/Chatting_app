// ignore_for_file: prefer_const_constructors, camel_case_types

import 'dart:convert';

import 'package:chat_app/modal/image_model.dart';
import 'package:chat_app/repo/image_reprosratory.dart';
import 'package:http/http.dart' as http;
import 'package:chat_app/modal/chat_massage_entity.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class chat_page extends StatefulWidget {
  final String username;
  const chat_page({super.key, required this.username});

  @override
  State<chat_page> createState() => _chatPageState(username);
}

class _chatPageState extends State<chat_page> {
  // waiter.getmenu();
  // waiter.getTodaySpecialDish();

  String username;
  _chatPageState(this.username);

  List<ChatMassageEntity> _message = [];

  _loadInitialMessages() async {
    final response =
        await rootBundle.loadString("build/flutter_assets/mock_messages.json");

    final List<dynamic> decodedList = jsonDecode(response) as List;

    final List<ChatMassageEntity> _chatMassages = decodedList.map((listItem) {
      return ChatMassageEntity.fromJson(listItem);
    }).toList();

    print(_chatMassages.length);
    setState(() {
      _message = _chatMassages;
    });
  }

  onmessageSend(ChatMassageEntity entity) {
    _message.add(entity);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    _loadInitialMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final username = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        elevation: 0,
        title: Text(
          "Hii $username!",
          style:
              TextStyle(color: Colors.black, fontFamily: 'FjallaOne-Regular'),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.logout,
                color: Colors.black87,
              )),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              // height: 200,
              child: ListView.builder(
                  itemCount: _message.length,
                  itemBuilder: (context, index) {
                    if (_message[index].author.userName == 'Omkar') {
                      return ChatBubble(
                          right: 150, left: 5, entity: _message[index]);
                    } else {
                      return ChatBubble(
                        right: 5,
                        left: 150,
                        entity: _message[index],
                      );
                    }
                  })),
          ChatInput(
            onsubmit: onmessageSend,
          )
        ],
      ),
    );
  }
}
