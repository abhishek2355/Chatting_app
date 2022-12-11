// ignore_for_file: prefer_const_constructors

import 'package:chat_app/modal/chat_massage_entity.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final ChatMassageEntity entity;

  final double right;
  final double left;
  const ChatBubble(
      {super.key,
      required this.right,
      required this.left,
      required this.entity});

  @override
  Widget build(BuildContext context) {
    bool isAuthor = entity.author.userName == "Abhishek";
    return Container(
      padding: EdgeInsets.all(10),
      // ignore: sort_child_properties_last, prefer_const_literals_to_create_immutables
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        mainAxisSize: MainAxisSize.min,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(
            // ignore: unnecessary_string_interpolations
            '${entity.text}',
            style: TextStyle(fontSize: 19),
          ),
          if (entity.imageUrl != null)
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(entity.imageUrl!)),
                  borderRadius: BorderRadius.circular(12)),
            )
        ],
      ),

      margin: EdgeInsets.only(top: 40, bottom: 20, right: right, left: left),
      decoration: BoxDecoration(
          color: isAuthor ? Theme.of(context).primaryColor : Colors.grey,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12))),
    );
  }
}
